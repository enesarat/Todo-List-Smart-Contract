// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract TodoList{
    struct Todo{ // We use struct as data structure to hold our Todo data.
        string text;
        bool completeStatus;
    }

    Todo[] public myTodoList; // We will keep our list in the list of the todo type we define as struct.

    // In this function, we get todo text data and save it into todo list.
    function createTodo(string calldata _todoText) external { // We get text parameter as calldata to save gas.
        myTodoList.push(
            Todo({
                text:_todoText,                                // In text parameter, we took text data of todo.
                completeStatus:false                           // In completeStatus parameter, we took completion status of todo.
            })
        );
    }

    // In this function, we get todo index with text data and make update on todo text that has same index.
    function updateTodoText(uint _todoIndex, string calldata _todoText) external { // We get text parameter as calldata to save gas.
        myTodoList[_todoIndex].text = _todoText;                                     //Since the number of units we will update is small, in order to save gas; we use this syntax where we only access the array once.
    }

    // In this function, we get todo index and find the todo that has same index.
    function getTodo(uint _todoIndex) external view returns(string memory _todoText,bool){
        Todo storage wantedTodo = myTodoList[_todoIndex];                                   // We create text parameter as storage to save gas.
        bool status = wantedTodo.completeStatus;                                            // We assign status value into return variable.
        string memory text = wantedTodo.text;                                               // We assign text value into return variable.
        return(text,status);
    }

    // In this function, we get todo index and toggle the todo status that has same index.
    function toggleStatus(uint _todoIndex) external{
        myTodoList[_todoIndex].completeStatus = !myTodoList[_todoIndex].completeStatus; // We assing the opposite value into completed status.
    }
}