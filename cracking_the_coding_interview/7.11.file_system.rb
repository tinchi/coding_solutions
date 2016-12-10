class Entry
  attr_accessor :parent, #folder
                :created_at, :last_update, :last_accessed,
                :name
  def initialize name, parent
    @name = name
    @parent = parent
    @created_at = Time.now
  end

  def delete
  end

  def size
  end

  def get_full_path
    return name if parent.nil?
    "#{parent.get_full_path}/#{name}"
  end
end

class File < Entry
  attr_accessor :content, :size

  def initialize name
    super
    #@size = #calculate size
  end
end

class Folder < Entry
  attr_accessor :contents

  def initialize
    super
    @contents = []
  end

  def size
    contents.inject(0, &:+)
  end

  def number_of_files
    contents.inject(0) do |sum, entry|
      sum + (entry.kind_of?(Folder) ? entry.number_of_files + 1 : 1)
    end
  end
end



