class RailsFormErrorWrapper
  def initialize model_with_errors
    @model_with_errors = model_with_errors
  end

  def [](name)
    if(@model_with_errors.respond_to?(:errors))
      @model_with_errors.errors.getAllOn(name)
    else
      return []
    end
  end
end

class RailsFormModelWrapper
  def initialize model_to_wrap
    @model_to_wrap = model_to_wrap
  end

  def errors
    RailsFormErrorWrapper.new(@model_to_wrap)
  end
end