class TransactionExampleService
  def self.call
    ApplicationRecord.transaction do
      DummyModel.create!(name: 'outer transaction')
      ApplicationRecord.transaction do
        DummyModel.create!(name: 'inner transaction')
        raise ActiveRecord::Rollback
      end
    end
  end
end

# class TransactionExampleService
#   def self.call
#     ApplicationRecord.transaction do
#       DummyModel.create!(name: 'outer transaction')
#       ApplicationRecord.transaction do
#         DummyModel.create!(name: 'inner transaction')
#         raise "Some Error"
#       end
#     rescue
#     end
#   end
# end


## with requires_new: true

# class TransactionExampleService
#   def self.call
#     ApplicationRecord.transaction do
#       DummyModel.create!(name: 'outer transaction')
#       ApplicationRecord.transaction(requires_new: true) do
#         DummyModel.create!(name: 'inner transaction')
#         raise ActiveRecord::Rollback
#       end
#     end
#   end
# end

# class TransactionExampleService
#   def self.call
#     ApplicationRecord.transaction do
#       DummyModel.create!(name: 'outer transaction')
#       ApplicationRecord.transaction(requires_new: true) do
#         DummyModel.create!(name: 'inner transaction')
#         raise "Some Error"
#       end
#     rescue
#     end
#   end
# end

# class TransactionExampleService
#   def self.call
#     ApplicationRecord.transaction do
#       DummyModel.create!(name: 'outer transaction')
#       ApplicationRecord.transaction(requires_new: true) do
#         DummyModel.create!(name: 'inner transaction')
#         raise "Some Error"
#       end
#     end
#   end
# end
