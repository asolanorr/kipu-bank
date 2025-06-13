// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title KipuBank - ETH Deposit and Withdrawal Vault
/// @author Alejandro Solano
/// @notice Allows users to deposit and withdraw ETH under certain restrictions
/// @dev This contract follows secure Solidity practices

contract KipuBank {
    /// @notice Deposit global limit
    uint256 public immutable bankCap;

    /// @notice Withdraw limit per transaction
    uint256 public immutable withdrawLimit;

    /// @notice Total amount deposited in the contract
    uint256 public totalDeposited;

    /// @notice ETH balance per user
    mapping(address => uint256) private balances;

    /// @notice Deposit count per user
    mapping(address => uint256) public depositCount;

    /// @notice Withdrawal count per user
    mapping(address => uint256) public withdrawalCount;

    // Custom Errors
    error DepositExceedsBankCap();
    error WithdrawalExceedsLimit();
    error InsufficientBalance();

    // Events
    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    // Modifiers
    /// @notice Validates that the withdrawal amount is allowed
    /// @param amount The amount the user wants to withdraw
    modifier validWithdrawal(uint256 amount) {
        if (amount > withdrawLimit) revert WithdrawalExceedsLimit();
        if (amount > balances[msg.sender]) revert InsufficientBalance();
        _;
    }

    /// @notice Validates that the withdrawal amount is allowed
    /// @param amount The amount the user wants to withdraw
    modifier validDeposit(uint256 amount) {
        if (totalDeposited + msg.value > bankCap) revert DepositExceedsBankCap();
        _;
    }

    /// @dev Constructor where we establish the limits
    /// @param _bankCap Deposit global limit
    /// @param _withdrawLimit Withdraw limit per transaction
    constructor(uint256 _bankCap, uint256 _withdrawLimit) {
        bankCap = _bankCap;
        withdrawLimit = _withdrawLimit;
    }

    /// @dev Method to made a safe transfer
    /// @param to Receiver address
    /// @param amount Amount to transfer
    function _safeTransfer(address to, uint256 amount) private {
        (bool sent, ) = to.call{value: amount}("");
        require(sent, "Transfer failed");
    }

    /// @notice Deposit ETH into personal vault
    /// @dev Follows checks-effects-interactions pattern
    function deposit() external payable validDeposit(msg.value) {
        totalDeposited += msg.value;
        balances[msg.sender] += msg.value;
        depositCount[msg.sender]++;

        emit Deposited(msg.sender, msg.value);
    }

    /// @notice Withdraw the specified amount (it have to be between the limits)
    /// @param amount withdrawal amount
    function withdraw(uint256 amount) external validWithdrawal(amount) {
        balances[msg.sender] -= amount;
        totalDeposited -= amount;
        withdrawalCount[msg.sender]++;

        _safeTransfer(msg.sender, amount);
        emit Withdrawn(msg.sender, amount);
    }

    /// @notice Get balance of the current address
    /// @return Current address total balance
    function getMyBalance() external view returns (uint256) {
        return balances[msg.sender];
    }
}
