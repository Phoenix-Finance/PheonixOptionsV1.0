pragma solidity ^0.4.26;
import "../modules/Ownable.sol";
interface IFPTCoin {
    function lockedBalanceOf(address account) external view returns (uint256);
    function lockedWorthOf(address account) external view returns (uint256);
    function getLockedBalance(address account) external view returns (uint256,uint256);
    function balanceOf(address account) external view returns (uint256);
    function totalSupply() external view returns (uint256);
    function mint(address account, uint256 amount) external;
    function burn(address account, uint256 amount) external;
    function burnLocked(address account, uint256 amount) external;
    function addlockBalance(address account, uint256 amount,uint256 lockedWorth)external; 
    function getTotalLockedWorth() external view returns (uint256);
    function addMinerBalance(address account,uint256 amount) external;
}
contract ImportIFPTCoin is Ownable{
    IFPTCoin internal _FPTCoin;
    function getFPTCoinAddress() public view returns(address){
        return address(_FPTCoin);
    }
    function setFPTCoinAddress(address FPTCoinAddr)public onlyOwner{
        _FPTCoin = IFPTCoin(FPTCoinAddr);
    }
}