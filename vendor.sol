// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract VendingMachine {

    address immutable owner = msg.sender;

    uint chocolates;
    uint water_bottles;
    uint chips;

    enum ItemType { Chocolate, WaterBottle, Chips }

    constructor(uint chocos, uint waters, uint chs) {
        chocolates = chocos;
        water_bottles = waters;
        chips = chs;
    }

    function ItemsCount() public view returns (uint, uint, uint) {
        return (chocolates, water_bottles, chips);
    }

    function GetItem(ItemType item) public {
        if(item == ItemType.Chocolate) {
            require(chocolates > 0, "No chocolate in vending machine");
            chocolates -= 1;
        } else if (item == ItemType.WaterBottle) {
            require(water_bottles > 0, "No water bottles in vending machine");
            water_bottles -= 1;
        } else if (item == ItemType.Chips) {
            require(chips > 0, "No chips in vending machine");
            chips -= 1;
        }
    }

    struct RefillItems {
        uint chocolates;
        uint water_bottles;
        uint chips;
    }

    function Refill(RefillItems memory refill) public {
        require(msg.sender == owner, "Only owner can refill");
        chocolates = chocolates + refill.chocolates;
        water_bottles = water_bottles + refill.water_bottles;
        chips = chips + refill.chips;
    }
}
