// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.11;

// We need some util functions for strings.
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

import { Base64 } from "./libraries/Base64.sol";

contract PumpkinNFT is ERC721URIStorage {
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

  string[] pumpkinColors = ["#b7094c", "#a01a58", "#892b64", "#723c70", "#5c4d7d", "#455e89", "#2e6f95", "#1780a1", "#0091ad"];
  string[] pumpkinNames = ["Eternal", "Infinity", "Dark Energy", "Galaxy", "Dark Matter", "Pumpkin", "Space", "Black Hole", "Quantum"];

  event NewEpicNFTMinted(address sender, uint256 tokenId);

  constructor() ERC721 ("PumpkinNFT", "PUMPKINS") {
    console.log("This is my NFT contract!");
  }

  function pickRandomColor(uint256 tokenId) public view returns (string memory) {
    uint256 rand = random(string(abi.encodePacked("PUMPKIN_COLOR", Strings.toString(tokenId))));
    rand = rand % pumpkinColors.length;
    return pumpkinColors[rand];
  }

  function pickRandomName(uint256 tokenId) public view returns (string memory) {
    uint256 rand = random(string(abi.encodePacked("PUMPKIN_NAME", Strings.toString(tokenId))));
    rand = rand % pumpkinNames.length;
    return pumpkinNames[rand];
  }

  function random(string memory input) internal pure returns (uint256) {
      return uint256(keccak256(abi.encodePacked(input)));
  }

  function makeAnEpicNFT() public {
    uint256 newItemId = _tokenIds.current();

    string memory color = pickRandomColor(newItemId);
    string memory name = pickRandomName(newItemId);

    // concatenate it all together
    string memory finalSvg = string(abi.encodePacked('<svg viewBox="-100 25 800 600" style="background-color:black" xmlns="http://www.w3.org/2000/svg"> <g fill="', color, '" stroke="#000" stroke-width="4" stroke-dasharray="2,8" stroke-linecap="round" stroke-linejoin="round"><path d="M150 150q50-40 100 0 50-30 100 0 50-40 100 0 150 200 100 300-50 70-100 50-50 30-100 0-50 40-100 0-50 30-100 0-50 20-100-50Q0 350 150 150Z"/><path d="M250 150q-70 200 0 350m100-350q70 200 0 350M200 130Q50 350 150 500m250-370q150 220 50 370"/></g><circle cx="300" cy="141" r="3"/><circle cx="300" cy="152" r="7"/><circle cx="300" cy="173" r="11"/><circle cx="300" cy="205" r="15"/><circle cx="300" cy="247" r="19"/><circle cx="300" cy="299" r="23"/><circle cx="300" cy="354" r="23"/><circle cx="300" cy="406" r="19"/><circle cx="300" cy="448" r="15"/><circle cx="300" cy="480" r="11"/><circle cx="300" cy="502" r="7"/><circle cx="300" cy="514" r="3"/><circle cx="281" cy="142" r="3"/><circle cx="275" cy="150" r="5"/><circle cx="270" cy="165" r="7"/><circle cx="265" cy="184" r="9"/><circle cx="261" cy="208" r="10"/><circle cx="258" cy="234.6" r="10.5"/><circle cx="257" cy="261.2" r="11"/><circle cx="255" cy="287.8" r="11.5"/><circle cx="253" cy="314.4" r="12"/><circle cx="253" cy="341" r="12"/><circle cx="255" cy="367.6" r="11.5"/><circle cx="257" cy="394.2" r="11"/><circle cx="258" cy="420.8" r="10.5"/><circle cx="261" cy="447.4" r="10"/><circle cx="265" cy="472" r="9"/><circle cx="270" cy="491" r="7"/><circle cx="275" cy="506" r="5"/><circle cx="260" cy="151" r="3"/><circle cx="256" cy="158" r="3.25"/><circle cx="253" cy="167" r="3.5"/><circle cx="249" cy="176" r="3.75"/><circle cx="247" cy="187" r="4"/><circle cx="244" cy="197" r="4.1"/><circle cx="241.5" cy="207" r="4.1"/><circle cx="239.5" cy="217" r="4.2"/><circle cx="237.5" cy="227" r="4.2"/><circle cx="236" cy="237" r="4.3"/><circle cx="234.5" cy="247" r="4.3"/><circle cx="233" cy="257" r="4.4"/><circle cx="231.5" cy="267" r="4.4"/><circle cx="230" cy="278" r="4.5"/><circle cx="229" cy="288" r="4.5"/><circle cx="228.5" cy="298" r="4.6"/><circle cx="228" cy="308" r="4.6"/><circle cx="227.5" cy="318" r="4.7"/><circle cx="227" cy="328" r="4.7"/><circle cx="227.5" cy="338.5" r="4.8"/><circle cx="228" cy="349" r="4.7"/><circle cx="228.5" cy="359.5" r="4.7"/><circle cx="229" cy="370.5" r="4.6"/><circle cx="230" cy="381" r="4.6"/><circle cx="231.5" cy="391" r="4.5"/><circle cx="233" cy="401" r="4.5"/><circle cx="234.5" cy="412" r="4.4"/><circle cx="236" cy="422" r="4.4"/><circle cx="238" cy="432" r="4.3"/><circle cx="240" cy="442" r="4.2"/><circle cx="242" cy="452" r="4.1"/><circle cx="245" cy="462" r="4"/><circle cx="248" cy="472" r="3.75"/><circle cx="251" cy="481" r="3.5"/><circle cx="255" cy="490" r="3.25"/><circle cx="258" cy="499" r="3"/><circle cx="319" cy="142" r="3"/><circle cx="325" cy="150" r="5"/><circle cx="330" cy="165" r="7"/><circle cx="335" cy="184" r="9"/><circle cx="339" cy="208" r="10"/><circle cx="342" cy="234.6" r="10.5"/><circle cx="343" cy="261.2" r="11"/><circle cx="345" cy="287.8" r="11.5"/><circle cx="347" cy="314.4" r="12"/><circle cx="347" cy="341" r="12"/><circle cx="345" cy="367.6" r="11.5"/><circle cx="343" cy="394.2" r="11"/><circle cx="342" cy="420.8" r="10.5"/><circle cx="339" cy="447.4" r="10"/><circle cx="335" cy="472" r="9"/><circle cx="330" cy="491" r="7"/><circle cx="325" cy="506" r="5"/><circle cx="340" cy="151" r="3"/><circle cx="344" cy="158" r="3.25"/><circle cx="347" cy="167" r="3.5"/><circle cx="351" cy="176" r="3.75"/><circle cx="353" cy="187" r="4"/><circle cx="356" cy="197" r="4.1"/><circle cx="358.5" cy="207" r="4.1"/><circle cx="360.5" cy="217" r="4.2"/><circle cx="362.5" cy="227" r="4.2"/><circle cx="364" cy="237" r="4.3"/><circle cx="365.5" cy="247" r="4.3"/><circle cx="367" cy="257" r="4.4"/><circle cx="368.5" cy="267" r="4.4"/><circle cx="370" cy="278" r="4.5"/><circle cx="371" cy="288" r="4.5"/><circle cx="371.5" cy="298" r="4.6"/><circle cx="372" cy="308" r="4.6"/><circle cx="372.5" cy="318" r="4.7"/><circle cx="373" cy="328" r="4.7"/><circle cx="372.5" cy="338.5" r="4.8"/><circle cx="372" cy="349" r="4.7"/><circle cx="371.5" cy="359.5" r="4.7"/><circle cx="371" cy="370.5" r="4.6"/><circle cx="370" cy="381" r="4.6"/><circle cx="368.5" cy="391" r="4.5"/><circle cx="367" cy="401" r="4.5"/><circle cx="365.5" cy="412" r="4.4"/><circle cx="364" cy="422" r="4.4"/><circle cx="362" cy="432" r="4.3"/><circle cx="360" cy="442" r="4.2"/><circle cx="358" cy="452" r="4.1"/><circle cx="355" cy="462" r="4"/><circle cx="352" cy="472" r="3.75"/><circle cx="349" cy="481" r="3.5"/><circle cx="345" cy="490" r="3.25"/><circle cx="342" cy="499" r="3"/><circle cx="220" cy="141" r="3"/><circle cx="215" cy="152" r="7"/><circle cx="205" cy="173" r="11"/><circle cx="190" cy="205" r="13"/><circle cx="177" cy="242" r="17"/><circle cx="167" cy="290" r="21"/><circle cx="162" cy="345" r="21"/><circle cx="165" cy="395" r="17"/><circle cx="177" cy="438" r="13"/><circle cx="190" cy="470" r="11"/><circle cx="200" cy="492" r="7"/><circle cx="205" cy="506" r="3"/><circle cx="185" cy="138" r="3"/><circle cx="173" cy="145" r="4"/><circle cx="155" cy="163" r="7"/><circle cx="138" cy="195" r="11"/><circle cx="116" cy="237" r="13"/><circle cx="92" cy="289" r="15"/><circle cx="70" cy="344" r="15"/><circle cx="59" cy="396" r="15"/><circle cx="70" cy="438" r="13"/><circle cx="90" cy="470" r="11"/><circle cx="110" cy="490" r="7"/><circle cx="125" cy="499" r="4"/><circle cx="380" cy="141" r="3"/><circle cx="385" cy="152" r="7"/><circle cx="395" cy="173" r="11"/><circle cx="405" cy="205" r="13"/><circle cx="420" cy="242" r="17"/><circle cx="433" cy="290" r="21"/><circle cx="438" cy="345" r="21"/><circle cx="433" cy="395" r="17"/><circle cx="420" cy="438" r="13"/><circle cx="405" cy="470" r="11"/><circle cx="395" cy="492" r="7"/><circle cx="385" cy="506" r="3"/><circle cx="415" cy="138" r="3"/><circle cx="427" cy="145" r="4"/><circle cx="445" cy="163" r="7"/><circle cx="462" cy="195" r="11"/><circle cx="484" cy="237" r="13"/><circle cx="508" cy="289" r="15"/><circle cx="530" cy="344" r="15"/><circle cx="541" cy="396" r="15"/><circle cx="530" cy="438" r="13"/><circle cx="510" cy="470" r="11"/><circle cx="490" cy="490" r="7"/><circle cx="475" cy="499" r="4"/></svg>'));

    string memory json = Base64.encode(
        bytes(
            string(
                abi.encodePacked(
                    '{"name": "',
                    abi.encodePacked(name, " Pumpkin"),
                    '", "image": "data:image/svg+xml;base64,',
                    Base64.encode(bytes(finalSvg)),
                    '"}'
                )
            )
        )
    );

    string memory finalTokenUri = string(
        abi.encodePacked("data:application/json;base64,", json)
    );

    _safeMint(msg.sender, newItemId);
  
    _setTokenURI(newItemId, finalTokenUri);
  
    _tokenIds.increment();
    console.log("An NFT w/ ID %s has been minted to %s", newItemId, msg.sender);
    console.log("Final Token URI: ", finalTokenUri);
    
    emit NewEpicNFTMinted(msg.sender, newItemId);
  }
}