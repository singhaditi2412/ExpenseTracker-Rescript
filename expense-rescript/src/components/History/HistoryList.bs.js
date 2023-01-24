// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";
import * as Belt_Array from "rescript/lib/es6/belt_Array.js";
import * as GlobalContext from "../../context/GlobalContext.bs.js";

import './History.css'
;

function HistoryList(Props) {
  var match = React.useContext(GlobalContext.context);
  return React.createElement("div", {
              className: "history"
            }, React.createElement("h3", {
                  className: "history-heading"
                }, "History", React.createElement("hr", undefined)), React.createElement("div", undefined, React.createElement("ul", {
                      className: "history-list"
                    }, Belt_Array.map(match.transactions, (function (transaction) {
                            return React.createElement("li", {
                                        key: String(transaction.id)
                                      }, React.createElement("p", undefined, transaction.text), React.createElement("p", undefined, "$", String(transaction.price)));
                          })))));
}

var make = HistoryList;

export {
  make ,
}
/*  Not a pure module */
