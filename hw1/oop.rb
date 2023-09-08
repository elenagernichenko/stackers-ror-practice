module ReverseName
    def funny_name
        @name.downcase.reverse.capitalize
    end
end

class User
    include ReverseName

    attr_reader :name

    def initialize(name, birth_year)
        @name = name
        @birth_year = birth_year
    end

    def self.class_name
        "It's a user class"
    end

    def age
        Time.now.year - @birth_year
    end

    def method_missing(m, *args, &block)
        "ныкохо нэма, а такого мэтода тем более `#{m}`"
    end

end

p User.class_name
me = User.new("Lena", 2004)
p me.name
p me.age

p me.funny_name
p me.undefined_method