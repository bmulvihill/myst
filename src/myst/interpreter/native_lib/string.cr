module Myst
  STRING_TYPE.instance_scope["+"] = TFunctor.new([
    TNativeDef.new(1) do |this, (arg), _block, _itr|
      this = this.as(TString)
      case arg
      when TString
        TString.new(this.value + arg.value)
      else
        raise "invalid argument for String#+: #{arg.type.name}"
      end
    end
  ] of Callable)

  STRING_TYPE.instance_scope["*"] = TFunctor.new([
    TNativeDef.new(1) do |this, (arg), _block, _itr|
      this = this.as(TString)
      case arg
      when TInteger
        # String multiplication repeats `this` `arg` times.
        TString.new(this.value * arg.value)
      else
        raise "invalid argument for String#*: #{arg.type.name}"
      end
    end
  ] of Callable)

  STRING_TYPE.instance_scope["to_s"] = TFunctor.new([
    TNativeDef.new(0) do |this, _args, _block, _itr|
      this.as(TString)
    end
  ] of Callable)

  STRING_TYPE.instance_scope["=="] = TFunctor.new([
    TNativeDef.new(1) do |this, (arg), _block, _itr|
      this = this.as(TString)
      case arg
      when TString
        TBoolean.new(this.value == arg.value)
      else
        TBoolean.new(false)
      end
    end
  ] of Callable)

  STRING_TYPE.instance_scope["!="] = TFunctor.new([
    TNativeDef.new(1) do |this, (arg), _block, _itr|
      this = this.as(TString)
      case arg
      when TString
        TBoolean.new(this.value != arg.value)
      else
        TBoolean.new(true)
      end
    end
  ] of Callable)
end
