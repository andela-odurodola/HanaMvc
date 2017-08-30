# class Object
#   def self.const_misssing(const)
#     require consts.to_s.to_snake_case
#     Object.const_get(const)
#   end
# end

class Object
  def self.const_missing(c)
    const = c.to_s
    require c.to_s.to_snake_case
    const.constantize
  end
end