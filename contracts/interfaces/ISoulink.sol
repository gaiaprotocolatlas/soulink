// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "./IERC4973.sol";
import "./IERC2981.sol";

interface ISoulink is IERC721, IERC4973, IERC2981 {
    event SetMinter(address indexed target, bool indexed isMinter);
    event SetRoyaltyInfo(address indexed receiver, uint256 fee);
    event SetContractURI(string uri);
    event SetBaseURI(string uri);

    function DOMAIN_SEPARATOR() external view returns (bytes32);
    function PERMIT_TYPEHASH() external view returns (bytes32);
    function PERMIT_ALL_TYPEHASH() external view returns (bytes32);
    function nonces(uint256 id) external view returns (uint256);
    function noncesForAll(address owner) external view returns (uint256);

    function nextId() external view returns (uint256);
    function isMinter(address target) external view returns (bool);

    function feeReceiver() external view returns (address);
    function fee() external view returns (uint256);

    function contractURI() external view returns (string calldata);

    function permit(
        address spender,
        uint256 id,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external;

    function permitAll(
        address owner,
        address spender,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external;

    function mint(address to) external returns (uint256 id);

    function mintBatch(uint256 limit) external;
}