require 'set'

def shortest_path(graph, start_node, end_node)
  unless graph.has_key?(start_node)
    raise ArgumentError, 'Start not in graph'
  end
  unless graph.has_key?(end_node)
    raise ArgumentError, 'End not in graph'
  end

  to_visit = Queue.new
  to_visit << start_node

  path = { start_node => nil }

  until to_visit.empty?
    current = to_visit.pop
    
    if current == end_node
      return reconstruct_path(path, start_node, end_node)
    end
    graph[current].each do |connection|
      unless path.has_key?(connection)

        to_visit << connection

        path[connection] = current
      end
    end
  end
  nil
end

def reconstruct_path(path, start_node, end_node)
 shortest_path = []
 current = end_node
 while current
   shortest_path << current
   current = path[current]
 end

 shortest_path.reverse!
end

#
# Instead of routing texts through cell towers, your app sends messages via the phones of nearby users, passing each message along from one phone to the next until it reaches the intended recipient. (Don't worry—the messages are encrypted while they're in transit.)
#
# Some friends have been using your service, and they're complaining that it takes a long time for messages to get delivered. After some preliminary debugging, you suspect messages might not be taking the most direct route from the sender to the recipient.
#
# Given information about active users on the network, find the shortest route for a message from one user (the sender) to another (the recipient). Return an array of users that make up this route.
#
# There might be a few shortest delivery routes, all with the same length. For now, let's just return any shortest route.
#
# Your network information takes the form of a hash mapping username strings to an array of other users nearby:
#
  network = {
  'Min'     => ['William', 'Jayden', 'Omar'],
  'William' => ['Min', 'Noam'],
  'Jayden'  => ['Min', 'Amelia', 'Ren', 'Noam'],
  'Ren'     => ['Jayden', 'Omar'],
  'Amelia'  => ['Jayden', 'Adam', 'Miguel'],
  'Adam'    => ['Amelia', 'Miguel', 'Sofia', 'Lucas'],
  'Miguel'  => ['Amelia', 'Adam', 'Liam', 'Nathan']

}
#
# For the network above, a message from Jayden to Adam should have this route:
#
#   ['Jayden', 'Amelia', 'Adam']

shortest_path(network, 'Jayden', 'Adam')
