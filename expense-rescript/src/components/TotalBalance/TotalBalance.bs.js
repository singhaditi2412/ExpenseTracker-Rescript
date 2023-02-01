// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";
import * as Belt_Array from "rescript/lib/es6/belt_Array.js";
import * as ExpenseContext from "../../context/ExpenseContext.bs.js";

import './TotalBalance.css'
;

function TotalBalance(Props) {
  var match = React.useContext(ExpenseContext.context);
  var total = Belt_Array.reduce(match.transactions, 0, (function (acc, value) {
          return acc + value.price | 0;
        }));
  return React.createElement("div", {
              className: "total-balance"
            }, React.createElement("h3", undefined, "YOUR BALANCE"), React.createElement("h1", undefined, "\u20B9 " + String(total) + ""));
}

var make = TotalBalance;

export {
  make ,
}
/*  Not a pure module */
