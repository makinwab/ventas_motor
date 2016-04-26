class Repository
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

    @repo_data = data.map { |row| hash_to_object(row.to_hash) }
  end

  def random
    @repo_data.sample
  end

  def hash_to_object(row)
    model_instance = @type.new
    row.each { |attr, value| model_instance.send("#{attr}=", value) }

    model_instance
  end

  def inspect
    "#<#{self.class} #{@repo_data.size} rows>"
  end
end
