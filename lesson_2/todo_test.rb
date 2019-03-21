require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < Minitest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    assert_equal(false, @list.done?)
  end

  def test_add_raise_error
    assert_raises(TypeError) do
      @list.add("Todo String")
    end
    assert_raises(TypeError) do
      @list.add(1)
    end
  end

  def test_shovel
    @todo4 = Todo.new("Do dishes")
    @list << @todo4
    @todos << @todo4
    assert_equal(@todos, @list.to_a)
  end

  def test_add
    @todo4 = Todo.new("Do dishes")
    @list.add(@todo4)
    @todos << @todo4
    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_equal(@todo1, @list.item_at(0))

    assert_raises(IndexError) do
      @list.item_at(100)
    end
  end

  def test_mark_done_at
    @list.mark_done_at(1)
    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(false, @todo3.done?)

    assert_raises(IndexError) do
      @list.mark_done_at(100)
    end
  end

  def test_mark_undone_at
    @todo1.done!
    @todo2.done!
    @todo3.done!

    @list.mark_undone_at(1)

    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(true, @todo3.done?)

    assert_raises(IndexError) do
      @list.mark_done_at(100)
    end
  end

  def test_done!
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def test_undone
    @list.done!
    @todo1.undone!
    assert_equal(false, @todo1.done?)
  end

  def test_remove_at
    assert_raises(IndexError) do
      @list.remove_at(100)
    end

    @list.remove_at(0)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_2
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    OUTPUT

    @list.mark_done_at(1)
    assert_equal(output, @list.to_s)
  end

  def test_to_s_3
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    assert_equal(output, @list.mark_all_done.to_s)
  end

  def test_each
    todo_arr = []
    @list.each { |todo| todo_arr << todo }
    assert_equal(@todos, todo_arr)
  end

  def test_each_2
    assert_equal(@list, @list.each{nil})
  end

  def test_select
    new_test_list = TodoList.new("Test")
    new_test_list << @todo2
    filtered_list = @list.select do |todo|
      todo.title.include? ("room")
    end

    assert_equal(new_test_list.to_a, filtered_list.to_a)
  end

  def test_find_by_title
    assert_equal(@todo2, @list.find_by_title("Clean room"))
  end

  def test_all_done
    @todo1.done!
    assert_equal([@todo1], @list.all_done.to_a)
  end

  def test_all_not_done
    @todo1.done!
    assert_equal([@todo2, @todo3], @list.all_not_done.to_a)
  end

  def test_mark_all_undone
    @list.done!
    @list.mark_all_undone
    assert_equal(true, !@list.done?)
  end

  def test_mark_done
    @list.mark_done("Clean room")
    assert_equal(true, @todo2.done?)
  end

end
