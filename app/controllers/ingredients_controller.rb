class IngredientsController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe.ingredients.create(post_params)

    redirect_to recipe_path(@recipe)
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.find(params[:id])
    @ingredient.destroy

    redirect_to recipe_path(@recipe)
  end

  private
    def post_params
      params.require(:ingredient).permit(:content)
    end
end
