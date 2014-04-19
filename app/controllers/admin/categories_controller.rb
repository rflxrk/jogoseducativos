class Admin::CategoriesController < Admin::AdminController
  inherit_resources
  actions :all, except: [:show]

  protected
    def category_params
      params.require(:category).permit(:name)
    end
end
