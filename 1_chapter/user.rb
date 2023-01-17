class User
    def name_sample
        return "匿名くん"
        # returnなしでも、以下の記述だけで返り値を出せる
        # "匿名くん"
    end
    
    def name=(name)
        @name = name
    end
    
    def name
        @name
    end
end