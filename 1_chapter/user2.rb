class User2
    attr_accessor :name, :address, :email
    def profile
        "#{name} (#{address})"
    end
end