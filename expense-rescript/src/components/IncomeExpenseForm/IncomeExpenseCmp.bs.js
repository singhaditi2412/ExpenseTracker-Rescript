// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";
import * as Belt_Array from "rescript/lib/es6/belt_Array.js";
import * as ExpenseContext from "../../context/ExpenseContext.bs.js";

import './IncomeExpenseCmp.css'
;

function IncomeExpenseCmp(Props) {
  var match = React.useContext(ExpenseContext.context);
  var transactions = match.transactions;
  var income = Belt_Array.reduce(transactions, 0, (function (acc, value) {
          if (value.price >= 0) {
            return acc + value.price | 0;
          } else {
            return acc;
          }
        }));
  var expense = Belt_Array.reduce(transactions, 0, (function (acc, value) {
          if (value.price < 0) {
            return acc + value.price | 0;
          } else {
            return acc;
          }
        }));
  return React.createElement("div", {
              className: "income-expense-cmp"
            }, React.createElement("div", {
                  className: "income"
                }, React.createElement("p", {
                      className: "title"
                    }, "INCOME"), React.createElement("p", {
                      className: "income-amount"
                    }, String(income))), React.createElement("div", {
                  className: "expense"
                }, React.createElement("p", {
                      className: "title"
                    }, "EXPENSE"), React.createElement("p", {
                      className: "expense-amount"
                    }, String(expense))));
}

var make = IncomeExpenseCmp;

export {
  make ,
}
/*  Not a pure module */
