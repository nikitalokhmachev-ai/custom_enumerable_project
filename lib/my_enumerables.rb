module Enumerable
  def my_each_with_index
    for i in 0...length
      yield self[i], i
    end
    self
  end

  def my_select
    results = []
    for el in self
      results.push(el) if yield el
    end
    results
  end

  def my_all?
    results = []
    for el in self
      results.push(el) if yield el
    end
    results.length == length
  end

  def my_any?
    results = []
    for el in self
      results.push(el) if yield el
    end
    !results.empty?
  end

  def my_none?
    results = []
    for el in self
      results.push(el) if yield el
    end
    results.empty?
  end

  def my_count
    if block_given?
      results = []
      for el in self
        results.push(el) if yield el
      end
      results.length
    else
      length
    end
  end

  def my_map
    result = []
    for el in self
      result.push(yield el)
    end
    result
  end

  def my_inject(initial_value)
    first_iter = true
    for val in self
      if first_iter
        result = yield initial_value, val
        first_iter = false
      else
        result = yield result, val
      end
    end
    result
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    for el in self
      yield el
    end
  end
end
