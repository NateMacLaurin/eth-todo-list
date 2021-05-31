pragma solidity ^0.5.0;

contract TodoList {
    //state variable -- smart contract state
  uint public taskCount = 0;

  struct Task {
    uint id;
    string content;
      //is the task completed or not?
    bool completed;
  }
    //uint key => value Task, "database" of tasks
    //we want to call tasks function to map out the tasks
    //Solidity won't map everything; we need the ID to know how many times to map over tasks.
  mapping(uint => Task) public tasks;
    
    
  event TaskCreated(
    uint id,
    string content,
    bool completed
  );

  event TaskCompleted(
    uint id,
    bool completed
  );
    //constructor function
  constructor() public {
    createTask("Try ERC-20!");
  }
    //creates a new task
  function createTask(string memory _content) public {
      //increment state variable to store id as key in the map of tasks
    taskCount ++;
      //create a new task array of Tasks
    tasks[taskCount] = Task(taskCount, _content, false);
      //
    emit TaskCreated(taskCount, _content, false);
  }

  function toggleCompleted(uint _id) public {
    Task memory _task = tasks[_id];
    _task.completed = !_task.completed;
    tasks[_id] = _task;
    emit TaskCompleted(_id, _task.completed);
  }

}
