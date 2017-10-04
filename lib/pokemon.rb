class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id: nil, name:, type:, db:, hp: nil)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp
  end

  def self.save(pk_name, pk_type, db)
    db.prepare("INSERT INTO pokemon (name, type) VALUES (?, ?)" ).execute(pk_name, pk_type)
  end

  def self.find(id, db)
    result = db.query("SELECT * FROM pokemon WHERE id = (?)", id).first
    Pokemon.new(id: id,name: result[1], type: result[2], db: db, hp: 60)
  end

end  #  End of Class
