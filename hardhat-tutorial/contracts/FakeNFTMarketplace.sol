//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;
contract FakeNFTMarketplace {
    // @dev Maintain a mapping of Fake TokenID to Owner addresses
    mapping(uint256 => address) public tokens;
    // seting purchase price for each FaKe NFT
    uint256 nftPrice = 0.1 ether;

    // @dev purchase() accepts ETH and marks the owner of the given tokenId as the caller address

    // @param _tokenId the fake NFT token id to purchase

    function purchase(uint256 _tokenId)  external payable {
        require(msg.value == nftPrice,"This NFT costs 0.1 ether");
        tokens[_tokenId] = msg.sender;
        
    }

    // dev getPrice() returns the price of one NFT
    function getPrice() external view returns (uint256){
        return nftPrice;
    }

    //checks whether the given tokenId has already been sold or not
    //_tokenid to for check for

    function available(uint256 _tokenId) external view returns (bool){
        // address(0) =0*000000000
        // This defalult value for addres in solidity

        if (tokens[_tokenId] == address(0)){
            return true;
        }
        return false;
    }


}    