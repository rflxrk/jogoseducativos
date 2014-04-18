require 'spec_helper'

describe Admin::CategoriesController do
  it_should_behave_like 'get success', action: :index, template: :index
  it_should_behave_like 'new action', assigns: 'category'
  it_should_behave_like 'create action', valid: :category, invalid: :invalid_category, model: Category
  it_should_behave_like 'edit action', valid: :category
  it_should_behave_like 'update action', valid: :category, invalid: :invalid_category, model: Category
  it_should_behave_like 'destroy action', valid: :category, model: Category
end
