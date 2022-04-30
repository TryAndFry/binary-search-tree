class Tree 
  include Comparable
  attr_accessor :root

  def initialize(array)
    @root = build_tree(array.sort.uniq)
  end

  def build_tree(array)
    return Node.new(array.first,nil,nil) if array.length == 1
    return  if array.empty?
    middle = array.length/2
    middle = middle if array.length.even?
    middle_value = array[middle]
    left_array = array[0..middle - 1]
    right_array = array[middle + 1..-1]
    Node.new(middle_value,build_tree(left_array),build_tree(right_array))
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def height(node = @root)
    return 0 if node == nil or (node.left.nil? and node.right.nil?)
    return 1 + [height(node.left), height(node.right)].max
  end

  def depth(node = @root)
    return 0 if node == @root
    count = 0
    ptr = @root
    until ptr.data == node.data
      count += 1
      ptr.data > node.data ? ptr = ptr.left : ptr = ptr.right
    end
    count
  end

  def delete(value)
    node_to_delete = find_recursive(value)
    return unless node_to_delete
    parent = find_parent(value)
    if node_to_delete.left.nil? and node_to_delete.right.nil? #deleting leaf node
      delete_leaf(node_to_delete,parent)
    elsif node_to_delete.left.nil? ^ node_to_delete.right.nil? #deleting node with a single child
      node_to_delete.left.nil? ? ptr = node_to_delete.right : ptr = node_to_delete.left
      node_to_delete.data < parent.data ? parent.left = ptr : parent.right = ptr
    else #deleting node with two children
      next_biggest = get_next_biggest(node_to_delete)
      next_biggest_parent = find_parent(next_biggest.data)
      delete_leaf(next_biggest, next_biggest_parent)
      next_biggest.right = node_to_delete.right
      next_biggest.left = node_to_delete.left
      node_to_delete.data > parent.data ? parent.right = next_biggest : parent.left = next_biggest
    end
  end

  def delete_leaf(node_to_delete,parent)
    return unless node_to_delete.left.nil? and node_to_delete.right.nil?
    node_to_delete.data > parent.data ? parent.right = nil : parent.left = nil
  end

  def get_next_biggest(node)
    ptr = node.right
    until ptr.left.nil?
      ptr = ptr.left
    end    
    ptr
  end

  def find_parent(value, node = @root)
    return if node.nil? or (node.left.nil? and node.right.nil?)
    return node if node.left.data == value or node.right.data == value
    node.data > value ? find_parent(value, node.left) : find_parent(value, node.right)
  end

  def inorder(node = @root, result = [], &block)
    inorder(node.left, result, &block) unless node.left.nil?
    block_given? ? yield(node) : result.push(node.data)
    inorder(node.right, result, &block) unless node.right.nil?
    result
  end

  def preorder(node = @root, result = [] , &block)
    block_given? ? yield(node) : result.push(node.data)
    preorder(node.left, result, &block) unless node.left.nil?
    preorder(node.right, result, &block) unless node.right.nil?
    result
  end

  def postorder(node = @root, result = [] , &block)
    postorder(node.left, result, &block) unless node.left.nil?
    postorder(node.right, result, &block) unless node.right.nil?
    block_given? ? yield(node) : result.push(node.data)
    result
  end

  def rebalance
    @root = build_tree(inorder.uniq)
  end

  def level_order
    result = [];
    q = []
    q.push(@root)
    until q.empty?
      ptr = q.shift
      q.push(ptr.left) unless ptr.left.nil?
      q.push(ptr.right) unless ptr.right.nil?
      block_given? ? yield(ptr) : result.push(ptr.data)
    end
    result
  end

  def balanced?
    (height(@root.left) - height(@root.right)).abs <= 1
  end

  def find_iterative(value)
    ptr = @root
    until ptr.nil?
      return ptr if ptr.data == value
      ptr.data > value ? ptr = ptr.left : ptr = ptr.right
    end
    nil
  end

  def find_recursive(value, node = @root)
    return node if node.nil? or node.data == value
    value < node.data ? find_recursive(value,node.left) : find_recursive(value,node.right)
  end

  def insert(value)
    ptr = @root
    previous_ptr = ptr
    until ptr.nil?
      previous_ptr = ptr
      ptr.data > value ? ptr = ptr.left : ptr = ptr.right
    end
    previous_ptr.data > value ? previous_ptr.left = Node.new(value) : previous_ptr.right = Node.new(value)
  end

  def insert_recurssive(value,node = @root)
    return node.left = Node.new(value) if value < node.data && node.left.nil?
    return node.right = Node.new(value) if value > node.data && node.right.nil?
    insert_recurssive(value,node.left) if value < node.data
    insert_recurssive(value,node.right) if value > node.data
  end

  class Node
    attr_accessor :data
    attr_accessor :left
    attr_accessor :right
    def initialize(data = nil, left = nil, right = nil)
      @data = data
      @left = left
      @right = right
    end
  end
end
