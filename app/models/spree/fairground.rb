module Spree::Fairground
  def self.table_name_prefix
    'spree_fairground_'
  end
  def self.use_relative_model_naming?
    true
  end
end
