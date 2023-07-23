---
title: Top 50 Graph Questions
date: 2023-07-20T15:10:44+05:30
draft: false
---

# Top 50 Graph Problems

Looking to master graph theory and solve graph problems efficiently? You're in the right place! This blog provides solutions to the top 50 graph problems along with multiple approaches for each problem. We also ensure that the written code is well-commented for better understanding.

Graphs are essential data structures used in various fields, including computer science, data analysis, and network analysis. By gaining proficiency in graph theory and problem-solving, you can enhance your skills and tackle complex challenges effectively.


List Of Questions :

- [Number of Provinces](#number-of-provinces)
- [Find the number of islands](#find-the-number-of-islands)
- [Detect cycle in an undirected graph](#detect-cycle-in-an-undirected-graph)
- [Hamiltonian Path](#hamiltonian-path)
- [Prerequisite Tasks](#prerequisite-tasks)
- [Course Schedule](#course-schedule)
- [Circle of Strings](#circle-of-strings)
- [Snake and Ladder problem](#snake-and-ladder-problem)
- [Bipartite Graph](#bipartite-graph)
- [Maximum Bipartite Matching](#maximum-bipartite-matching)
- [Detect cycle in a directed graph](#detect-cycle-in-a-directed-graph)
- [Find whether path exists](#find-whether-path-exists)
- [Topological Sort](#topological-sort)
- [Level of Nodes](#level-of-nodes)
- [Possible paths between 2 vertices](#possible-paths-between-2-vertices)
- [X Total Shapes](#x-total-shapes)
- [Distance of nearest cell having 1](#distance-of-nearest-cell-having-1)
- [Mother Vertex](#mother-vertex)
- [Unit Area of largest region of 1’s](#unit-area-of-largest-region-of-1s)
- [Rotten Oranges](#rotten-oranges)
- [Minimum Swaps to Sort](#minimum-swaps-to-sort)
- [Steps by Knight](#steps-by-knight)
- [Implementing Dijkstra Algorithm](#implementing-dijkstra-algorithm)
- [Neeman’s Shoes](#neemans-shoes)
- [Minimum Spanning Tree](#minimum-spanning-tree)
- [Strongly Connected Components (Kosaraju’s Algo)](#strongly-connected-components-kosarajus-algo)
- [Bridge Edge in Graph](#bridge-edge-in-graph)
- [Flood Fill Algorithm](#flood-fill-algorithm)
- [Replace O’s with X’s](#replace-os-with-xs)
- [Shortest Prime Path](#shortest-prime-path)
- [Word Search](#word-search)
- [Construct binary palindrome by repeated appending and trimming](#construct-binary-palindrome-by-repeated-appending-and-trimming)
- [Word Boggle](#word-boggle)



# Graph Problem Heading

## **Print adjacency list**

Given the adjacency list of a bidirectional graph. Your task is to copy/clone the adjacency list for each vertex and return a new list.


### Code (C++)

```cpp
vector<vector<int>> printGraph(int V, vector<int> adj[])
    {

        vector<vector<int>> graph(V);
        int k=0;
        while(k<V)
        {
            graph[k].push_back(k);
            k++;
        }
        for(int i=0;i<V;i++)
        {

            for(int x : adj[i])
            {
                graph[i].push_back(x);
            }
        }
        return graph;
    }
```

## **BFS of graph**

Given a directed graph. The task is to do Breadth First Traversal of this graph starting from 0.

`Note`: One can move from node u to node v only if there's an edge from u to v and find the BFS traversal of the graph starting from the 0th vertex, from left to right according to the graph. Also, you should only take nodes directly or indirectly connected from Node 0 in consideration.

### Solution

```cpp
vector<int> bfsOfGraph(int V, vector<int> adj[])
    {
        // Vector to store the nodes visited in BFS order
        vector<int> nodes;

        // Array to keep track of visited nodes
        int visited[V] = {false};

        // Create a queue for BFS traversal
        queue<int> q;

        // Start BFS from vertex 0
        q.push(0);
        visited[0] = true;


        // Perform BFS traversal
        while (!q.empty())
        {
            int front = q.front();
            nodes.push_back(front);
            q.pop();

            // Traverse all adjacent nodes of the current node
            for (auto node : adj[front])
            {
                // If the adjacent node is not visited, mark it as visited,
                // add it to the visited nodes vector, and enqueue it for further traversal
                if (!visited[node])
                {
                    visited[node] = true;
                    q.push(node);
                }
            }
        }

        // Return the vector containing the nodes visited in BFS order
        return nodes;

    }
```

## **DFS of Graph**

You are given a connected undirected graph. Perform a Depth First Traversal of the graph.
Note: Use a recursive approach to find the DFS traversal of the graph starting from the 0th vertex from left to right according to the graph.

### Solution

```cpp
/*
 * Depth First Traversal (DFS) of a Graph
 *
 * This code implements a recursive approach to perform a Depth First Traversal (DFS) of a connected undirected graph.
 * The DFS traversal starts from the 0th vertex and explores all reachable vertices from each visited vertex.
 * The traversal order is from left to right according to the graph.
 */

void dfs(vector<int> adj[],int i,vector<bool>&visited,vector<int>&ans)
    {
        
            visited[i]=true;
            ans.push_back(i);
            for(int vertex : adj[i])
            {
                if(!visited[vertex])
                {
                    dfs(adj,vertex,visited,ans);
                }
                
            }
        
    }
    
    vector<int> dfsOfGraph(int V, vector<int> adj[])
    {
        vector<int> ans;
        vector<bool> visited(V,false);
        
        
        for(int i=0;i<V;i++)
        {
            if(!visited[i])
            {
                dfs(adj,i,visited,ans);
            }
        }
        return ans;
    }

```

## **Number of Provinces**

Given an undirected graph with V vertices. We say two vertices u and v belong to a single province if there is a path from u to v or v to u. Your task is to find the number of provinces.

Note: A province is a group of directly or indirectly connected cities and no other cities outside of the group. 


### **Solution (using BFS)**

```cpp
#include <vector>
#include <queue>
using namespace std;

// Breadth-First Search (BFS) function
void bfs(vector<vector<int>>& adj, int V, int N, bool* visited) {
queue<int> q;
visited[N] = true;
q.push(N);


while (!q.empty()) {
    int top = q.front();
    q.pop();
    for (int i = 0; i < V; i++) {
        if (!visited[i] && adj[top][i]) {
            q.push(i);
            visited[i] = true;
        }
    }
}

}

// Function to find the number of provinces in the graph
int numProvinces(vector<vector<int>>& adj, int V) {
bool visited[V] = { false };
int no_of_provinces = 0;



for (int i = 0; i < V; i++) {
    if (!visited[i]) {
        bfs(adj, V, i, visited);
        no_of_provinces++;
    }
}

return no_of_provinces;

}
```
### **Solution (using DFS)**

```cpp

void dfs(int index, vector<vector<int>> adj, int visited[], int V)
    {
        visited[index] = 1;
        
        for(int i = 0; i < V; i++)
        {
            if(adj[index][i] and visited[i] == 0)
            {
                visited[i] = 1;
                dfs(i, adj, visited, V);
            }
        }
    }
    
    int numProvinces(vector<vector<int>> adj, int V) {
        
        int visited[V] = {0};
        int comp = 0;
        
        for(int i = 0; i < V; i++)
        {
            if(!visited[i])
            {
                comp++;
                dfs(i, adj, visited, V);
            }
        }
        
        return comp;
    }


```

## **Find the number of islands**

Given a grid of size n*m (n is the number of rows and m is the number of columns in the grid) consisting of '0's (Water) and '1's(Land). Find the number of islands.

Note: An island is either surrounded by water or boundary of grid and is formed by connecting adjacent lands horizontally or vertically or diagonally i.e., in all 8 directions.




### **Solution**

```cpp

int vis[501][501]={{0}};
    int n,m;
    int dx[8] = { -1, 1, 0, 0, -1, -1, 1, 1};
    int dy[8] = {0, 0, -1, 1, -1, 1, -1, 1};
    
    bool val(int r,int c)
    {
        if(r<0 || r>=n || c<0 || c>=m)
        {
            return 0;
        }
        else
        {
            return 1;
        }
    }
    
    void dfs(int r,int c)
    {
        vis[r][c]=1;
        for(int i=0;i<8;i++)
        {
            int nr=r+dx[i];
            int nc=c+dy[i];
            if(val(nr,nc) && vis[nr][nc]==0)
            {
                dfs(nr,nc);
                
            }
        }
    }
    
    int numIslands(vector<vector<char>>& grid)
    {
        // Code here
        n=grid.size();
        m=grid[0].size();
        
        int no_of_island=0;
        
        for(int i=0;i<n;i++)
        {
            for(int j=0;j<m;j++)
            {
                if(grid[i][j]=='0')
                {
                    vis[i][j]=1;
                }
            }
        }
        for(int i=0;i<n;i++)
        {
            for(int j=0;j<m;j++)
            {
                if(!vis[i][j])
                {
                    dfs(i,j);
                    no_of_island++;
                }   
            }
        }
        return no_of_island;
        
    }


```

## **Detect cycle in an undirected graph**

Given an undirected graph with V vertices and E edges, check whether it contains any cycle or not. Graph is in the form of adjacency list where adj[i] contains all the nodes ith node is having edge with.


### **Solution**

```cpp
#include <vector>
using namespace std;

// Depth-First Search (DFS) function
bool dfs(vector<int> adj[], vector<bool>& visited, int source, int parent) {
visited[source] = true;



for (auto node : adj[source]) {
    if (visited[node] == false) {
        if (dfs(adj, visited, node, source)) {
            return true;
        }
    } else if (node != parent) {
        return true;
    }
}

return false;

}

// Function to check whether the graph contains any cycle
bool isCycle(int V, vector<int> adj[]) {
vector<bool> visited(V, false);



for (int i = 0; i < V; i++) {
    if (visited[i] == false) {
        if (dfs(adj, visited, i, -1)) {
            return true;
        }
    }
}

return false;

}

```


## **Hamiltonian Path**

A Hamiltonian path, is a path in an undirected graph that visits each vertex exactly once. Given an undirected graph, the task is to check if a Hamiltonian path is present in it or not.


### **Solution**

```cpp
 bool dfs(int n, vector<int> adj[], vector<int> &vist, int src){
        if(n==0){
            return true;
        }
        vist[src]=1;
        for(auto &x:adj[src]){
            if(vist[x]==0){
                if(dfs(n-1,adj,vist,x)){
                    return true;
                }
            }
        }
        vist[src]=0;
        return false;
    }
    bool check(int N,int M,vector<vector<int>> Edges)
    {
        // code here
        int n= N, m= M;
        vector<int> adj[n];
        
        for(auto &x:Edges){
            adj[x[0]-1].push_back(x[1]-1);
            adj[x[1]-1].push_back(x[0]-1);
        }
        
        vector<int> vist(n,0);
        
        for(int i=0;i<n;i++){
            if(dfs(n-1,adj,vist,i)){
                return true;
            }
        }
        return false;
    }
```

## **Prerequisite Tasks**

There are a total of N tasks, labeled from 0 to N-1. Some tasks may have prerequisites, for example to do task 0 you have to first complete task 1, which is expressed as a pair: [0, 1]
Given the total number of tasks N and a list of prerequisite pairs P, find if it is possible to finish all tasks.


### **Solution**

```cpp
bool isPossible(int N, vector<pair<int, int> >& prerequisites) {
	    // Code here
	    
	    int n = N;
	    
	    vector<vector<int>> graph(n);
        vector<int> indegree(n,0);
        for(auto c : prerequisites)
        {
            graph[c.second].push_back(c.first);
            indegree[c.first]++;
        }
        
        vector<int> toposort;
        queue<int> q;
        for(int i=0;i<n;i++)
        {
            if(indegree[i]==0) 
                q.push(i);
        }
        while(!q.empty())
        {
            int curr = q.front();
            q.pop();
            toposort.push_back(curr);
            
            for(auto nbr: graph[curr])
            {
                indegree[nbr]--;
                if(indegree[nbr]==0) 
                    q.push(nbr);
            }
        }
        if(toposort.size()!=n) 
        	return false;
        	
        return true;
	}
```


## **Course Schedule**
There are a total of n tasks you have to pick, labeled from 0 to n-1. Some tasks may have prerequisites tasks, for example to pick task 0 you have to first finish tasks 1, which is expressed as a pair: [0, 1]
Given the total number of n tasks and a list of prerequisite pairs of size m. Find a ordering of tasks you should pick to finish all tasks.
Note: There may be multiple correct orders, you just need to return one of them. If it is impossible to finish all tasks, return an empty array. Returning any correct order will give the output as 1, whereas any invalid order will give the output "No Ordering Possible".



### **Solution (Using Kosarajus Algorithm)**

```cpp
bool dfs(int i ,vector<vector<int>> &adj,vector<int> &visited , vector<int> &recursive_stack ,stack<int>&answer)
    {
         recursive_stack[i]= true;
         visited[i]=true;
         
        for(auto node: adj[i])
        {
            
            if(!visited[node])
            {
                if(dfs(node,adj,visited,recursive_stack,answer))
                {
                    return true;
                }
                
            }
            else if(recursive_stack[node]==true)
            {
                return true;
            }
            
            
        }
        answer.push(i);
        recursive_stack[i]= false;
        
        return false;
    }
        
    vector<int> findOrder(int n, int m, vector<vector<int>> prerequisites) 
    {
        //code here
        vector<int>ordering;
        vector<int>visited(n,0),recursive_stack(n,0);
	    
	    vector<vector<int>> adj(n);
	    stack<int>answer;
	    
	    // converting the list into adj matrix
	     for (auto& prerequisite : prerequisites) {
            int course = prerequisite[0];
            int prerequisiteCourse = prerequisite[1];
            adj[prerequisiteCourse].push_back(course);
        }
	    
	    
	    // now traversing through adj using dfs
	    
	    for(int i=0;i<n;i++)
	    {
	        if(!visited[i])
	        {
	            if(dfs(i,adj,visited,recursive_stack,answer))
	            {
	                
	                return {};
	            }
	        }
	    }
	    
	    while (!answer.empty()) {
            ordering.push_back(answer.top());
            answer.pop();
        }

        return ordering;
        
        
        
    }
```

## **Solution (Using Kahn’s algorithm for Topological Sorting)**

```cpp
vector<int> findOrder(int n, int m, vector<vector<int>> prerequisites) 
    {
        
        
        /* Here I used Kahns algorithm, first will find the inorder of all nodes, if we found
        inorder=0 for a node, then we will push it in a queue, to traverse the graph like we did in BFS.
        Then through that node we will travserv the other nodes, decrementing their indegrees.
        */
        vector<vector<int>>graph(n);
        vector<int>indegree(n,0);
        queue<int>q;
        vector<int>toposort;
        
        for(int i=0;i<m;i++)
        {
            graph[prerequisites[i][1]].push_back(prerequisites[i][0]);
            indegree[prerequisites[i][0]]++;
        }
        
        for(int i=0;i<n;i++)
        {
            if(indegree[i]==0)
            {
                q.push(i);
                toposort.push_back(i);
            }
        }
        
        while(!q.empty())
        {
            int front = q.front();
            q.pop();
            for(auto node : graph[front])
            {
                indegree[node]--;
                if(indegree[node]==0)
                {
                    q.push(node);
                    toposort.push_back(node);
                }
            }
        }
        if(toposort.size() != n)
        {
            return vector<int>();
        }
        return toposort;
        
    }
```


## **Circle of strings**
Given an array of lowercase strings A[] of size N, determine if the strings can be chained together to form a circle.
A string X can be chained together with another string Y if the last character of X is same as first
character of Y. If every string of the array can be chained, it will form a circle.

For example, for the array arr[] = {"for", "geek", "rig", "kaf"} the answer will be Yes as the given strings can be chained as "for", "rig", "geek" and "kaf"



### **Solution**

```cpp
    void dfs(int node, vector<int> adj[], vector<int> &vis)
    {
        vis[node]=1;
        
        for(auto child: adj[node])
        {
            if(vis[child]==0)
            {
                dfs(child,adj,vis);
            }
        }

    }

    int isCircle(int N, vector<string> A)
    {
        int n= N;
        vector<int> adj[26];
        vector<int> in(26,0), out(26,0);
        
        for(int i=0;i<n;i++)
        {
            int ch1=A[i][0]-'a';
            int ch2=A[i].back()-'a';
            
            adj[ch1].push_back(ch2); //linking all componenets to form a eulerian cycle and test later

            // so here we are linking the first character and the last character of a string together

            in[ch2]++;
            out[ch1]++;
        }
        
        vector<int> vis(26,0); 
        int src=0;
        
        
        for(int i=0;i<26;i++)
        {
            if(in[i]!=out[i])
            {
                return 0;
            }
        }

        for(int i=0;i<26;i++)
        {
            if(out[i]!=0)
            {
                src=i;
                break;
            }
        }
        
        dfs(src,adj,vis);
        
        for(int i=0;i<26;i++)
        {
            if(vis[i]==0 && out[i])
            {
                return 0;
            }
        }
        
        return 1;
    }

```




## **Bipartite Graph**
Given an adjacency list of a graph adj  of V no. of vertices having 0 based index. Check whether the graph is bipartite or not.



### **Solution**

```cpp

    bool isBipartite(int V, vector<int>adj[])
	{
        /*This code works on a simple principle that, while traversing the graph, you first color the first node and then you color all its neighbour with alternate color, and you keep on repeating the process. While doing so, if you found any node which is already colored and has the same color as the parent node, then its not the bi-partite graph. Else it is. */

        // this code works for disconnected as well as connected graph

        // consider red as 0 and blue as 1

	    vector<int>color(V,-1);
	    queue<pair<int,int>>q; // first -> node, second -> color
	    
	    for(int i=0;i<V;i++)
	    {
	        if(color[i]==-1)
	        {
	            color[i]=0;
	            q.push({i,0});
	            while(!q.empty())
    	        {
    	            
    	            pair<int,int> front = q.front();
        	        q.pop();
        	        int node = front.first;
        	        int col = front.second;
        	        
        	        for(int neighbour : adj[node])
        	        {
        	            if(color[neighbour] == col)
        	            {
        	                return 0;
        	            }
        	            else if(color[neighbour]==-1)
        	            {
        	                color[neighbour] = (col)?(0):(1);
        	                q.push({neighbour,color[neighbour]});
        	            }
        	        }
    	            
    	        }
	            
	        }
	        
	    }
	    
	    return 1;
	}

```
## **Detect cycle in a directed graph**
Given a Directed Graph with V vertices (Numbered from 0 to V-1) and E edges, check whether it contains any cycle or not.



### **Solution**
```cpp
    bool dfs(int i ,vector<int> adj[],vector<int> &visited , vector<int> &recursive_stack )
    {
         recursive_stack[i]= true;
         visited[i]=true;

        for(auto node: adj[i])
        {
            if(!visited[node])
            {
                if(dfs(node,adj,visited,recursive_stack))
                {
                    return true;
                }
                
            }
            else if(recursive_stack[node]==true) // that means if it is visited and also present in a recursive stack , which means cycle is present 
            {
                return true;
            }

        }
        
        recursive_stack[i]= false;
        return false;
    }

    bool isCyclic(int V, vector<int> adj[])
    {
        
        vector<int>visited(V,0),recursive_stack(V,0);
        
        for(int i=0;i<V;i++)
        {
            for(auto node : adj[i])
            {
                if(!visited[i])
                {
                    // note that dfs function here returns true if cycle is present and returns false when cycle is not present
                    if(dfs(i,adj,visited,recursive_stack))
                    {
                        return true;
                    }
                }
            }
        }
        
        return false;
        
    }
```

## **Find whether path exist**
Given a grid of size n*n filled with 0, 1, 2, 3. Check whether there is a path possible from the source to destination. You can traverse up, down, right and left.
The description of cells is as follows:

A value of cell 1 means Source. \
A value of cell 2 means Destination.\
A value of cell 3 means Blank cell.\
A value of cell 0 means Wall.

Note: There are only a single source and a single destination.



### **Solution Using BFS**

```cpp
    int dx[4] = { -1, 1, 0, 0};
    int dy[4] = {0, 0, -1, 1};
    bool val(int x,int y,int n)
    {
        if(x<0 || y<0 || x>=n || y>=n)
        {
            return 0;
        }
        return 1;
    }
    
    
    bool is_Possible(vector<vector<int>>& grid) 
    {
        //code here
        int n=grid.size();
        queue<pair<int,int>>q;
        for(int i=0;i<n;i++)
        {
            for(int j=0;j<n;j++)
            {
                if(grid[i][j]==1)
                {
                    q.push({i,j});
                    grid[i][j]=0;
                    break;
                }
            }
        }
        while(!q.empty())
        {
            int x=q.front().first;
            int y=q.front().second;
            q.pop();
            for(int i=0;i<4;i++)
            {
                int nx=x+dx[i];
                int ny=y+dy[i];
                if(val(nx,ny,n)==1 && grid[nx][ny]!=0)
                {
                    
                    if(grid[nx][ny]==2)
                    {
                        return 1;
                    }

                    //here just aking sure that, we do not visit the same vertex twice, so making 3 to 0

                    grid[nx][ny]=0;
                    q.push({nx,ny});
                }
            }
            
        }
        return 0;
        
    }
```

### **Solution Using DFS**
```cpp
bool dfs(int x, int y, vector<vector<int>>& v)
    {
        if(x<0 || x>=v.size() || y<0 || y>=v.size() || v[x][y]==0) return false;
        if(v[x][y]==2) return true;
        v[x][y] = 0;
        
        bool ans = dfs(x+1,y,v) || dfs(x-1,y,v) || dfs(x,y+1,v) || dfs(x,y-1,v);
        return ans;
    }
    
    bool is_Possible(vector<vector<int>>& v) 
    {
        int n = v.size();
        queue<pair<int,int>> q;
        for(int i=0;i<n;i++)
        {
            for(int j=0;j<n;j++)
            {
                if(v[i][j]==1)
                {
                    if(dfs(i,j,v)) return true;
                    else return false;
                }
            }
        }
    }
```

## **Topological sort**

Given a Directed Acyclic Graph (DAG) with V vertices and E edges, Find any Topological Sorting of that Graph.




### **Solution BFS (Kahn's Algo)**

BFS Approach || Kahn's Algo
Idea

The idea is that all nodes which will be at starting will have indegree 0. 

`Algorithm`

Store Indegree of all nodes in Array.\
Push nodes in Queue whose indegree == 0.\
Now, For each node in Queue.\
Pop the current node & Store into resultant Array\
Remove indegree count of all neighbours of current node.\
If neighbours indegree becomes 0 the push into queue.\
Finally, return resultant Array.


```cpp
    vector<int> topoSort(int V, vector<int> adj[])
    {
	    vector<int> res;
	    vector<int> indegree(V, 0);
	    
	    for(int i = 0; i < V; i++)
        {
	        for(int nbr : adj[i])
            {
	            indegree[nbr]++;
	        }
	    }
	    
	    queue<int> q;
	    for(int i = 0; i < V; i++)
        {
	        if(indegree[i] == 0)
            {
	            q.push(i);
	        }
	    }
	    
	    while(!q.empty())
        {
	        int curr = q.front(); q.pop();
	        res.push_back(curr);
	        
	        for(int nbr : adj[curr])
            {
	            indegree[nbr]--;
	            if(indegree[nbr] == 0) q.push(nbr);
	        }
	    }
	    
	    return res;
	}

```

### **Solution DFS Approach**
`Idea`

Node that comes at last must be present at last. Hence, the idea is to store last visited at bottom. Thus, Stack comes into picture.

`Algorithm`

Make visited Array to tackle both disconnected & visited Nodes.
Call DFS on each unvisited node
Call DFS on unvisited Neighbours
After making all calls to Neighbours Store current Node in a Stack.
Finally, pop all the elements of stack into resultant Vector

```cpp
    void dfs(int start, vector<bool> &vis, stack<int> &s, vector<int> adj[])
    {
	    vis[start] = 1;
	    
	    for(int nbr : adj[start])
        {
	        if(!vis[nbr])
            {
	            dfs(nbr, vis, s, adj);
	        }
	    }
	    
	    s.push(start);
	}
	
	vector<int> topoSort(int V, vector<int> adj[])
    {
	    vector<bool> vis(V);
	    stack<int> s;
	    for(int i = 0; i < V; i++)
        {
	        if(!vis[i])
            {
	            dfs(i, vis, s, adj);
	        }
	    }

	    vector<int> res;

	    for(int i = 0; i < V; i++)
        {
	        res.push_back(s.top()); 
            s.pop();
	    }
	    return res;
	}
```
## **Level Of Nodes**

Given a Undirected Graph with V vertices and E edges, Find the level of node X. if X does not exist in the graph then print -1.
Note: Traverse the graph starting from vertex 0.

## Solution
Just do a simple BFS and , when node_we_want == it , then just return level +1 (here level variable is the level of the parent).


### Code (C++)

```cpp
int nodeLevel(int V, vector<int> adj[], int X) 
	{   
	    queue<pair<int, int> > q; 
	    q.push({0,0});
	    vector<int > vis(V , 0 );
	    vis[0] = 1 ;

	    while(!q.empty())
        {
	        int node = q.front().first;
	        int level = q.front().second;
	        q.pop();
	        for(auto it : adj[node])
            {
	            if(X == it)return level +1 ;
	            if(vis[it] == 0 )
                {
	                q.push({it,level +1 });
	                vis[it] = 1;
	            }
	               
	        }
	    }

	    return -1;
	}
```

## **Possible paths between 2 vertices**

Given a Directed Graph having V nodes numbered from 0 to V-1, and E directed edges. Given two nodes, source and destination, count the number of ways or paths between these two vertices in the directed graph. These paths should not contain any cycle.
Note: Graph doesn't contain multiple edges, self-loop, and cycles.

## Solution

Just do a BFS starting from source and if you found a node such that node == destination, then increment res and continue the loop. If you doesnt find a node == destination then put all its neighbours into queue. 

### Code (C++)

```cpp
int countPaths(int V, vector<int> adj[], int source, int destination) {
        int res = 0;
        queue<int> q;
        q.push(source);
        while (!q.empty())
        {
            int currentNode = q.front();
            q.pop();
            if (currentNode == destination)
            {
                res++;
                continue;
            }
            for (int neighbor : adj[currentNode])
            {
                q.push(neighbor);
            }
        }
        return res;
    }

```

## **X Total Shapes**

Given  a grid of n*m consisting of O's and X's. The task is to find the number of 'X' total shapes.
Note: 'X' shape consists of one or more adjacent X's (diagonals not included).

## Solution
Easy problem, just do a DFS and mark the nodes as visited.
The no of times you are going to do DFS the no of X total shapes will be there.


### Code (C++)

```cpp
/* here I used vis array of 100 * 100 dimension , you can create a dynamic vector
and allocate the size accordingly, I just didnt done that beacause I am lazy to push it aas a parameter in every function :) 

*/

    int vis[100][100]={{0}};
    int dx[4]={-1,1,0,0};
    int dy[4]={0,0,-1,1};
    int n1,m1;
    bool val(int r,int c)
    {
        if(r>=n1 || r<0 || c>=m1 || c<0)
        {
            return false;
        }
        else
        {
            return true;
        }
    }
    void dfs(int r,int c , vector<vector<char>>& grid)
    {
        vis[r][c]=1;
        
        for(int i=0;i<4;i++)
        {
            int nr=r+dx[i];
            int nc=c+dy[i];
            if(vis[nr][nc]==0 && val(nr,nc)==true && grid[nr][nc]!='O')
            {
                dfs(nr,nc,grid);
            }
        }
    }
    int xShape(vector<vector<char>>& grid) 
    {
        // Code here
        
        int count=0;
        int r=grid.size();
        int c=grid[0].size();
        
       
        n1=r;
        m1=c;
        
        for(int i=0;i<r;i++)
        {
            for(int j=0;j<c;j++)
            {
                if(!vis[i][j] && grid[i][j]!='O')
                {
                    dfs(i,j,grid);
                    count++;
                }
            }
        }
        return count;
    }

```

## **Distance of nearest cell having 1**

Given a binary grid of n*m. Find the distance of the nearest 1 in the grid for each cell.
The distance is calculated as |i1  - i2| + |j1 - j2|, where i1, j1 are the row number and column number of the current cell, and i2, j2 are the row number and column number of the nearest cell having value 1. There should be atleast one 1 in the grid.

## Solution



### Code (C++)

```cpp
    int dx[4]={-1,1,0,0};
    int dy[4]={0,0,-1,1};
    
    bool val(int nx,int ny,int r,int c)
    {
        if(nx<0 || nx>=r || ny<0 || ny>=c)
        {
            return 0;
        }
        else
        {
            return 1;
        }
    }
    
	vector<vector<int>>nearest(vector<vector<int>>grid)
	{
	    // Code here
	    int r=grid.size();
	    int c=grid[0].size();
	    vector<vector<int>> v(r,vector<int>(c,-1));
	    queue<pair<int,int>>q;
	    
	    for(int i=0;i<r;i++)
	    {
	        for(int j=0;j<c;j++)
	        {
	            if(grid[i][j]==1)
	            {
	                // if block is 1 then push in queue
	                v[i][j]=0;
	                q.push({i,j});
	            }
	        }
	    }
	    
	    while(!q.empty())
	    {
	        pair<int,int> curr=q.front();
	        q.pop();
	        
	        for(int i=0;i<4;i++)
	        {
	            int nx=curr.first+dx[i];
	            int ny=curr.second+dy[i];
	            
	            if(val(nx,ny,r,c) && v[nx][ny]==-1)
	            {
	                v[nx][ny]=v[curr.first][curr.second]+1;
	                q.push({nx,ny});
	                
	            }
	        }
	    }
	    return v;

	}
```
## **Mother Vertex**
Given a Directed Graph, find a Mother Vertex in the Graph (if present). 
A Mother Vertex is a vertex through which we can reach all the other vertices of the Graph.

## Solution
Do a DFS from every vertex and after doing DFS if no of visited vertex +1(including mother vertex) == no of titial vertex, then 
it is a mother vertex. 


### Code (C++)

```cpp
    void dfs(int src,vector<int>vec[],vector<int>&visited,int &count)
    {
        visited[src] = true;
        
        for(auto e:vec[src])
        {
            if(!visited[e])
            {
                count++;
                dfs(e,vec,visited,count);
            }
        }
    }

	int findMotherVertex(int V, vector<int>adj[])
	{
	    
	    int n=V;
	    for(int i=0;i<n;i++)
        {
	        int count =0;
	        vector<int>visited(n,false);
	        
	        dfs(i,adj,visited,count);
	        
	        if(count+1==n)
            {
	            return i;
            }
	    }   

        return -1;
	    
	}

```

## **Unit Area of largest region of 1's**

Given a grid of dimension nxm containing 0s and 1s. Find the unit area of the largest region of 1s.
Region of 1's is a group of 1's connected 8-directionally (horizontally, vertically, diagonally).


## Solution

Same as [X Total Shapes](#x-total-shapes). Just we have to maintaine a max varialbe which will store tyhe maximum value of area.

### Code (C++)

```cpp
    int n,m,count=0,max=0;
    int dx[8] = { -1, 1, 0, 0, -1, -1, 1, 1};
    int dy[8] = {0, 0, -1, 1, -1, 1, -1, 1};
    bool val(int r,int c)
    {
        if(r<0 || r>=n || c<0 || c>=m)
        {
            return 0;
        }
        else
        {
            return 1;
        }
    }
    void dfs(int r,int c, vector<vector<int>>& visited)
    {
        visited[r][c]=1;
        count++;
        if(max<count)
        {
            max = count;
        }

        for(int i=0;i<8;i++)
        {
            int nr=r+dx[i];
            int nc=c+dy[i];
            if(val(nr,nc) && visited[nr][nc]==0)
            {
                dfs(nr,nc,visited);
                
            }
        }
        
    }

    int findMaxArea(vector<vector<int>>& grid)
    {
        n = grid.size();
        m = grid[0].size();
        int no_of_islands=0;
        
        
        vector<vector<int>> visited(n,vector<int>(m,0));
        
        for(int i=0;i<n;i++)
        {
            for(int j=0;j<m;j++)
            {
                if(grid[i][j]==0)
                {
                    visited[i][j]=1;
                }
            }
        }
        
        
        for(int i=0;i<n;i++)
        {
            for(int j=0;j<m;j++)
            {
                if(!visited[i][j])
                {
                    dfs(i,j,visited);
                    count=0;
                }   
            }
        }
        return max;
        
    }
```

## **Rotten Oranges**
Given a grid of dimension nxm where each cell in the grid can have values 0, 1 or 2 which has the following meaning:
0 : Empty cell
1 : Cells have fresh oranges
2 : Cells have rotten oranges

We have to determine what is the minimum time required to rot all oranges. A rotten orange at index [i,j] can rot other fresh orange at indexes [i-1,j], [i+1,j], [i,j-1], [i,j+1] (up, down, left and right) in unit time. 



## Solution
Here approach is that, you have to store all rotten oranges in a queue and then make their neighbour oranges rooten.
And then push them into queue. And then increment the time by 1. Do this till all oranges get rotted.


### Code (C++)

```cpp
    int dx[4]={-1,1,0,0};
    int dy[4]={0,0,-1,1};
    
    bool val(int nx,int ny,int r,int c)
    {
        if(nx<0 || nx>=r || ny<0 || ny>=c)
        {
            return 0;
        }
        else
        {
            return 1;
        }
    }

    int orangesRotting(vector<vector<int>>& grid)
    {
        
        int r=grid.size();
        int c=grid[0].size();
        queue<pair<int,int>> q;
        int ans=-1;
        for(int i=0;i<r;i++)
        {
            for(int j=0;j<c;j++)
            {
                if(grid[i][j]==2)
                {
                    q.push({i,j});
                }
            }
        }
        
        while(!q.empty())
        {
            int qs=q.size();
            while(qs--)
            {
                auto curr=q.front();
                q.pop();
                for(int i=0;i<4;i++)
                {
                    int nx=curr.first+dx[i];
                    int ny=curr.second+dy[i];
                    if(val(nx,ny,r,c) && grid[nx][ny]==1)
                    {
                        grid[nx][ny]=2;
                        q.push({nx,ny});
                        
                    }
                }
                
            }
            ans++;
            
        }

        for(int i=0;i<r;i++)
        {
            for(int j=0;j<c;j++)
            {
                if(grid[i][j]==1)
                {
                    return -1;
                }
            }
        }
        
        return ans;
        
    }
```


## **Steps by Knight**
Given a square chessboard, the initial position of Knight and position of a target. Find out the minimum steps a Knight will take to reach the target position.

Note:
The initial and the target position coordinates of Knight have been given according to 1-base indexing.


## Solution



### Code (C++)

```cpp
    int dx[8] = {2,2,-2,-2,1,-1,1,-1};
    int dy[8] = {1,-1,1,-1,2,2,-2,-2};
    
    
    // global variable dist
    
    vector<vector<int>> dist;
    
    bool check(int x,int y,int N)
    {
        return (x >= 0 && y >= 0 && x <= N && y <= N);
    }
    
	int minStepToReachTarget(vector<int>&KnightPos,vector<int>&TargetPos,int N)
	{
	    
	    if(KnightPos[0] == TargetPos[0] && KnightPos[1] == TargetPos[1])
	    {
	        return 0;
	    }
	    
	    dist = vector<vector<int>>(N+1,vector<int>(N+1,0));
	    
	    // initialize with N+1 as indexing start from 1
	    
        queue<pair<int,int>> q;
	    q.push(make_pair(KnightPos[0],KnightPos[1]));
	    
	    while(!q.empty())
	    {
            pair<int,int> xx = q.front();
            q.pop();
            for(int i=0;i<8;i++)
            {
                int nr=xx.first + dx[i];
                int nc=xx.second + dy[i];
                
                if(check(nr,nc,N) && (dist[nr][nc]) == 0)
                {
                    dist[nr][nc] = dist[xx.first][xx.second] + 1;
                    q.push(make_pair(nr,nc));
                    if(nr==TargetPos[0] && nc==TargetPos[1])
                    {
                        return dist[TargetPos[0]][TargetPos[1]];
                    }
                }
            }
        }
        
        // if still not return then that eans its imoossible 
        
        // return -1
        
        return -1;
 
	}
```

## **Implementing Dijkstra Algorithm**

Given a weighted, undirected and connected graph of V vertices and an adjacency list adj where adj[i] is a list of lists containing two integers where the first integer of each list j denotes there is edge between i and j , second integers corresponds to the weight of that  edge . You are given the source vertex S and You to Find the shortest distance of all the vertex's from the source vertex S. You have to return a list of integers denoting shortest distance between each node and Source vertex S.
 

Note: The Graph doesn't contain any negative weight cycle.

## Solution

Dijkstra's algorithm works by visiting vertices in the graph starting with the object's starting vertex, S, and it iterates a greedy loop over the edge of the vertex set. The algorithm keeps track of the currently known shortest distance from each node to the source node and it updates these values if it finds a shorter path.

### Code (C++)

```cpp

vector <int> dijkstra(int V, vector<vector<pair<int,int>>>& adj, int S)
{
    // Create a priority queue to store vertices that
    // are being preprocessed. This is weird syntax in C++.
    // Refer below explanation for syntax.
    priority_queue< pair<int,int>, vector <pair<int,int>> , greater<pair<int,int>> > pq;
 
    // Create a vector for distances and initialize all
    // distances as infinite (INF)
    vector<int> dist(V, INT_MAX);
 
    // Insert source itself in priority queue and initialize
    // its distance as 0.
    pq.push(make_pair(0, S));
    dist[S] = 0;
 
    /* Looping till priority queue becomes empty (or all
      distances are not finalized) */
    while (!pq.empty())
    {
        // The first vertex in pair is the minimum distance
        // vertex, extract it from priority queue.
        // vertex label is stored in second of pair (it
        // has to be done this way to keep the vertices
        // sorted distance (distance must be first item
        // in pair)
        int u = pq.top().second;
        pq.pop();
 
        // 'i' is used to get all adjacent vertices of a vertex
        vector<pair<int, int>>::iterator i;
        for (i = adj[u].begin(); i != adj[u].end(); ++i)
        {
            // Get vertex label and weight of current adjacent
            // of u.
            int v = (*i).first;
            int weight = (*i).second;
 
            //  If there is shorted path to v through u.
            if (dist[v] > dist[u] + weight)
            {
                // Updating distance of v
                dist[v] = dist[u] + weight;
                pq.push(make_pair(dist[v], v));
            }
        }
    }
 
    return dist;
}

    
```
## **Neeman's Shoes**
Due to the second wave of Gorona virus, Geekland imposed another lockdown and Geek has gained some wieght. Now Geek has decided to exercise.
There are N intersections in the city numbered from 0 to N-1 and M bidirectional roads each road connecting two intersections. All the intersections are connected to each-other through some set of roads, ith road connect intersections A[i][0] and A[i][1] and is of length A[i][2].
Every morning Geek will start at intersection src and will run/walk upto intersection dest. Geek only has one hour in the morning so he will choose to cover the shortest path from src to dest.
After planning his exercising schedule, Geek wants to buy the perfect shoes to walk/run in the morning. He goes to Neeman's Shoe factory which is the National Shoe factory of Geekland. 

Geek sees that there are two types of shoes "Neeman's Wool Joggers" and "Neeman's Cotton Classics", "Neeman's Wool Joggers" are good for running and "Neeman's Cotton Classics" are good for walking.
Geek is confused which shoes to buy, so he comes up with a strategy. If the distance he has to cover in the morning is less than or equal to X, then he will walk the distance, therefore he will buy "Neeman's Cotton Classics". If the distance is greater than X, he will buy "Neeman's Wool Joggers". Geek is too lazy to calculate the shortest distance between two intersections src and dest. Help him decide which shoes to buy.



## Solution



### Code (C++)

```cpp
    typedef pair<int, int> iPair; 

    string exercise(int N, int M, vector<vector<int>> A, int src, int dest, int X)
    {
        
     vector<vector<int>>adj[N] ;
       
       for( auto i : A )
       {
           adj[i[0]].push_back({ i[1] , i[2]}) ;
           adj[i[1]].push_back({ i[0] , i[2]}) ;
           
       }
       vector<int>distance( N , INT_MAX ) ;
       distance[src] = 0 ;

       priority_queue<iPair, vector<iPair>, greater<iPair> >pq;
       pq.push({ 0 , src }) ;
       
       while(!pq.empty())
       {
           int u = pq.top().second ;
           pq.pop() ;
           for( int j = 0 ; j < adj[u].size() ; j++ )
           {
               int v = adj[u][j][0] ;
               int weight =  adj[u][j][1] ;
               
               if( distance[u] + weight < distance[v])
               {
                   distance[v] = distance[u] + weight ;
                   pq.push({ distance[v] , v }) ;
               }
           }
           
       }
       
       int d = distance[dest] ;
       
       if(d<=X)
       {
           return  "Neeman's Cotton Classics" ;
       }
       
       return "Neeman's Wool Joggers" ;
    }
    
```

## **Minimum Spanning Tree**

Given a weighted, undirected and connected graph of V vertices and E edges. The task is to find the sum of weights of the edges of the Minimum Spanning Tree.

## Solution



### Code (C++)

```cpp
int spanningTree(int V, vector<vector<int>> adj[])
    {
        priority_queue<pair<int,int>,vector<pair<int,int>>,greater<pair<int,int>>>pq;
       pq.push({0,0});
       vector<bool>visit(V,false);
       int ans=0;
       while(!pq.empty()){
           auto p=pq.top();
           pq.pop();
           int x=p.second;
           int w=p.first;
           if(visit[x])continue;
           visit[x]=true;
           ans+=w;
           for(auto y:adj[x]){
               if(!visit[y[0]]){
                   pq.push({y[1],y[0]});
               }
           }
       }
       return ans;
    }
    
```
## **Strongly Connected Components (Kosaraju's Algo)**

Given a Directed Graph with V vertices (Numbered from 0 to V-1) and E edges, Find the number of strongly connected components in the graph.
 

## Solution

Approach :

    sort the graph topologically and store it in the stack.
    transpose the given graph
    do the dfs(accordig to the top element of the stack you got from topo sort) and count everytime you run the dfs

### Code (C++)

```cpp
void dfs(int n, vector<vector<int>>& adj, vector<int> &v, stack<int> &st)
{       
        v[n] = 1;
        
        for(int ch : adj[n])
        {
                
            if(!v[ch])
            {
                v[ch] = 1;
                dfs(ch, adj, v, st);
            }
        }
        
        st.push(n);
    }
    
      // Simple DFS on transposed Graph
    void tdfs(int n, vector <vector<int>> &adj, vector <int> &v)
    {
            
       v[n] = 1;
       
       for(int k : adj[n])
       {
           
           if(!v[k])
           {
               v[k] = 1;
               tdfs(k, adj, v);
           }
       }
    }   
    
    
    int kosaraju(int V, vector<vector<int>>& adj)
    {
            
        vector <int> visited(V, 0);
        stack <int> st;
        
        // Take on Stack
        for(int i = 0;i < V;i ++)
        {
            if(!visited[i])
            {
                dfs(i, adj, visited, st);
            }
        }
        
        // Transpose Of Graph
        vector <vector <int>> trans(V);
        
        for(int i = 0;i < V;i++)
        {
            visited[i] = 0; // Reset visited 
            for(int nr : adj[i])
            {
                trans[nr].push_back(i);        
            }
        }
                
        // DFS 
        int ans = 0;

        while(!st.empty())
        {
            
            int tp = st.top();
            st.pop();
            
            if(!visited[tp])
            {
                tdfs(tp, trans, visited);
                ans++;
            }
        
        }
        
        return ans;
    }
    
```


## **Bridge edge in a graph**
Given a Graph of V vertices and E edges and another edge(c - d), the task is to find if the given edge is a Bridge. i.e., removing the edge disconnects the graph.


## Solution
If in a graph we start traversing from a given node C with a given condition (as in LINE 15) [please read conditions]
and even then if node D gets visited, it means there is another edge available in the graph to reach D.
Because of this, even if the edge from C to D is removed, the Graph will not be divided into two components.

So, if node D gets visited, it means the edge from C to D is not a Bridge.
And if node D remains UNVISITED even after traversing the entire graph, it means the edge from C to D is a BRIDGE.


### Code (C++)

```cpp
    void dfs( int node, vector<int> adj[], int c , int d,vector<int> &visited)
	{
	    visited[node] = true ; 
	    
	    for(auto nbr : adj[node])
	    {
	        if( !visited[nbr] && (node!=c || nbr != d) )
	        dfs(nbr, adj, c, d, visited ) ; 
	    }
	}
	
	
    int isBridge(int V, vector<int> adj[], int c, int d) 
    {
        vector<int> visited(V, false) ;
        dfs( c , adj , c, d , visited ) ;//send C as initial node 

        return !visited[d] ; 
    }
    
```


## ** **



## Solution



### Code (C++)

```cpp
    
```
## **Flood fill Algorithm**

An image is represented by a 2-D array of integers, each integer representing the pixel value of the image.

Given a coordinate (sr, sc) representing the starting pixel (row and column) of the flood fill, and a pixel value newColor, "flood fill" the image.

To perform a "flood fill", consider the starting pixel, plus any pixels connected 4-directionally to the starting pixel of the same color as the starting pixel, plus any pixels connected 4-directionally to those pixels (also with the same color as the starting pixel), and so on. Replace the color of all of the aforementioned pixels with the newColor.

## Solution

Just a simple DFS question.

### Code (C++)

```cpp
    
    int r ;
    int c ;
    int dx[4] = {1,-1,0,0};
    int dy[4] = {0,0,-1,1};
    int oldColor;
    
    void dfs(vector<vector<int>>& image, int sr, int sc, int newColor,vector<vector<int>>& visited)
    {
        visited[sr][sc] = 1;
        
        
            for(int i=0;i<4;i++)
            {
                int x = dx[i]+sr;
                int y = dy[i]+sc;
                
                if(x >= 0 && x < r && y >= 0 && y < c && image[x][y] == oldColor && visited[x][y]==0  )
                {
                    image[x][y] = newColor;
                    dfs(image,x,y,newColor,visited);
                }
            }
        
        
        
    }
    vector<vector<int>> floodFill(vector<vector<int>>& image, int sr, int sc, int newColor)
    {
        // Code here 
        
        
        
        r = image.size();
        c = image[0].size();
        vector<vector<int>>visited(r,vector<int>(c,0));
        oldColor = image[sr][sc];
        image[sr][sc] = newColor;
        dfs(image,sr,sc,newColor,visited);
        return image;
        
    }
```

## **Replace O's with X's**

Given a matrix mat of size N x M where every element is either O or X.
Replace all O with X that are surrounded by X.
A O (or a set of O) is considered to be surrounded by X if there are X at locations just below, just above, just left and just right of it.

Example 1:

Input: n = 5, m = 4
mat = {{'X', 'X', 'X', 'X'}, 
       {'X', 'O', 'X', 'X'}, 
       {'X', 'O', 'O', 'X'}, 
       {'X', 'O', 'X', 'X'}, 
       {'X', 'X', 'O', 'O'}}
Output: ans = {{'X', 'X', 'X', 'X'}, 
               {'X', 'X', 'X', 'X'}, 
               {'X', 'X', 'X', 'X'}, 
               {'X', 'X', 'X', 'X'}, 
               {'X', 'X', 'O', 'O'}}
Explanation: Following the rule the above 
matrix is the resultant matrix. 


## Solution
    We will use boundary DFS to solve this problem
        
    Let's analyze when an 'O' cannot be flipped,
    if it has atleast one 'O' in it's adjacent, AND ultimately this chain of adjacent 'O's is connected to some 'O' which lies on boundary of board
        
    consider these two cases for clarity :
      
        O's won't be flipped          O's will be flipped
        [X O X X X]                   [X X X X X]     
        [X O O O X]                   [X O O O X]
        [X O X X X]                   [X O X X X] 
        [X X X X X]                   [X X X X X]
      
      So we can conclude if a chain of adjacent O's is connected some O on boundary then they cannot be flipped
      
    
        
      Steps to Solve :
      1. Move over the boundary of board, and find O's 
      2. Every time we find an O, perform DFS from it's position
      3. In DFS convert all 'O' to '#'      (why?? so that we can differentiate which 'O' can be flipped and which cannot be)   
      4. After all DFSs have been performed, board contains three elements,#,O and X
      5. 'O' are left over elements which are not connected to any boundary O, so flip them to 'X'
      6. '#' are elements which cannot be flipped to 'X', so flip them back to 'O'


### Code (C++)

```cpp

    void DFS(vector<vector<char>>& mat, int i, int j, int n, int m)
    {
        if(i<0 or j<0 or i>=n or j>=m or mat[i][j] != 'O') return;
        mat[i][j] = '#';
        DFS(mat, i-1, j, n, m);
        DFS(mat, i+1, j, n, m);
        DFS(mat, i, j-1, n, m);
        DFS(mat, i, j+1, n, m);
    }
    
    vector<vector<char>> fill(int n, int m, vector<vector<char>> mat)
    {
         if(n == 0) return mat;  
            
         
         //Moving over firts and last column   
         for(int i=0; i<n; i++) {
             if(mat[i][0] == 'O')
                 DFS(mat, i, 0, n, m);
             if(mat[i][m-1] == 'O')
                 DFS(mat, i, m-1, n, m);
         }
            
            
         //Moving over first and last row   
         for(int j=0; j<m; j++) {
             if(mat[0][j] == 'O')
                 DFS(mat, 0, j, n, m);
             if(mat[n-1][j] == 'O')
                 DFS(mat, n-1, j, n, m);
         }
            
         for(int i=0; i<n; i++)
             for(int j=0; j<m; j++)
             {
                 if(mat[i][j] == 'O')
                     mat[i][j] = 'X';
                 if(mat[i][j] == '#')
                     mat[i][j] = 'O';
             }
     
        return mat;
        
        
    }
    
```

## **Word Search**

Given a 2D board of letters and a word. Check if the word exists in the board. The word can be constructed from letters of adjacent cells only. ie - horizontal or vertical neighbors. The same letter cell can not be used more than once.

Example 1:

Input: board = {{a,g,b,c},{q,e,e,l},{g,b,k,s}},
word = "geeks"
Output: 1
Explanation: The board is-
a g b c
q e e l
g b k s
The letters which are used to make the
"geeks" are colored.

Example 2:

Input: board = {{a,b,c,e},{s,f,c,s},{a,d,e,e}},
word = "sabfs"
Output: 0
Explanation: The board is-
a b c e
s f c s
a d e e
Same letter can not be used twice hence ans is 0


## Solution



### Code (C++)

```cpp
    bool solve(int  i , int j , int ind , string word , vector<vector<char>> &board , vector<vector<int>> &vis)
    {
       if(ind == word.size())
       return true;
       
       int n = board.size(), m = board[0].size();
       
       if(i>= n || j>=m || i<0 || j<0 || vis[i][j]==1 || board[i][j] != word[ind])
       return false;
     
       vis[i][j]  = 1;
       if(solve(i+1 , j , ind + 1 , word , board , vis) || 
       solve(i , j+1 , ind + 1 , word , board , vis) || 
       solve(i-1 , j , ind + 1 , word , board , vis) || 
       solve(i , j-1 , ind + 1 , word , board , vis))
       return true;
       
       vis[i][j] = 0;
       
       return false;
       
    }
    bool isWordExist(vector<vector<char>>& board, string word)
    {
        // Code here
        
         int m = board[0].size() , n = board.size();
        vector<vector<int>> vis(n , vector<int> (m , 0));
        for(int  i = 0 ;i < n ; i++)
        {
            for(int j = 0 ; j   < m ; j++){
                if(board[i][j] == word[0])
                  if(solve(i, j , 0 , word , board , vis))
                    return true;
            }
        }
        return false;
        
        
    }
```

## **Construct binary palindrome by repeated appending and trimming**
Given n and k, Construct a palindrome of size n using the binary representation of the number k.To construct the palindrome you can use the binary number of size k as many times as you wish and also you can trim all the  zeros from the end.The palindrome must always begin with 1 and contains the maximum number of zeros.
 


## Solution



### Code (C++)

```cpp
    string binaryPalindrome(int n,int k)
    {
       // Complete the function
       
       
       
       
       string s(n,'0');
       
       for(int i=0;i<n;)
       {
               s[i]='1';
               s[n-1-i]='1';
               i+=k;
           
       }
       
       return s; 
    }
```


## Further Improvement / reading

text
