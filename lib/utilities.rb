module Mongoid
  module Finders
    extend Origin::Forwardable

    select_with :with_default_scope
    delegate :aggregates, :avg, :each, :extras, :find_and_modify, :includes,
      :map_reduce, :max, :min, :sum, :update, :update_all, to: :with_default_scope

    # adds custom utilities methods to class level Document
    def some_method
      p "some code here"
    end

  end
end