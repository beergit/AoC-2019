class Chemical
  attr_reader(:name, :receipe, :quantity)
  def initialize(receipe)
    if receipe.is_a? Symbol
      @name = receipe
      @quantity = 0
      @receipe = {}
    else
      sp = receipe.chop.split(/,|(=>)/)
      @name = (sp[-1].split)[1].to_sym
      @quantity = (sp[-1].split)[0].to_i
      @receipe = sp[0..-3].map{|x| [x.split[1].to_sym, (x.split[0]).to_i]}.to_h
    end
    @storage = 0
  end

  def produce(amount)
    if(@storage >= amount)
      factor = 0
      @storage -= amount
    else
      factor = ((amount - @storage)/quantity.to_f).ceil
      @storage += factor*quantity - amount
    end
    receipe.transform_values{|v| v*factor}
  end
end


