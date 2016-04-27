class Repository
  attr_reader :model_instances
  
  #load up csv file
  def initialize(folder, repos, type)
    @@file_path = folder + "/#{repos}.csv"
    @type = type
    data = CSV.read(
      @@file_path,
      headers: true,
      header_converters: :symbol,
      converters: :all
    )

    @model_instances = data.map { |row| hash_to_object(row.to_hash) }
  end

  def random
    @model_instances.sample
  end

  def find_by_name(name)
    find do |model_instance|
      return model_instance if model_instance.name == name
    end
  end

  def find_all_by_name(name)
    instances = Array.new
    find do |model_instance|
      instances << model_instance if model_instance.name == name
    end

    instances
  end

  def inspect
    "#<#{self.class} #{@repo_data.size} rows>"
  end

  private

  def find
    @model_instances.each do |model_instance|
      yield(model_instance) if block_given?
    end
  end

  def hash_to_object(row)
    model_instance = @type.new
    row.each { |attr, value| model_instance.send("#{attr}=", value) }

    model_instance
  end
end
