Project Link: https://www.theodinproject.com/lessons/ruby-binary-search-trees

A binary search tree is created by taking a group of data items that get turened into a tree of nodes where each left node is lower than each right node.

To create a balanced BST we need to...

1. Get the middle of the array and make it root

2. Recursivly do the same for the left half then the right half
   a) Get the middle of the left hald and amke it left child of the step 1 root
   b) repeat '2a' for the right half

PROBLEM STATEMENT
"Given a sorted integer array of lenght n, create a balamced BST using elements of the array"

ALGO

1. initialze (i = 0), end = length - 1
2. mid = (start + end) / 2
3. create a tree node with mid as root
4. recursivly do the following steps
5. calculate mid of left subarray and make it root of left subtree A
6. calculate mid of right subarray and make it root of right subtree of A
