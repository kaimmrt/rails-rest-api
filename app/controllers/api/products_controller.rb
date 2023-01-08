module Api
    class ProductsController < ApplicationController

        before_action :set_product, only: %i[update show destroy]

        def index
            @products = Product.all
            if !@products.blank?
                @message = 'Products listed'
                render :index, status: :ok
            else
                @message = 'Do have not product'
                handler_error
            end
        end

        def show
            if !@product.blank?
                render :show, status: :ok
            else
                handler_error
            end
        end

        def get_by_name
            @products = Product.where(name: params[:name]).order(created_at: :desc)
            if !@products.blank?
                render 'index.json.jbuilder', status: :ok
            else
                @message = 'No product found by name'
                handler_error
            end
        end

        def create
            @product = Product.create(product_params)

            if @product.valid?
                @product.save
                render :create, status: :ok
            else
                @message = @product.error.full_messages
                handler_error
            end
        end

        def update
            if @product.update(product_params)
                @message = "Successful"
                render :update, status: :ok
            else
                @message = "Error"
                handler_error
            end
        end

        def destroy
           if @product.destroy
           else
            @message = 'An error occurred while deleting'
            handler_error
           end
        end

        private

        def handler_error
            render :error, status: :bad_request
        end

        def set_product
            @product=Product.find(params[:id])
        end

        def product_params
            params.permit(:name, :description, :quantity, :price, :product_image, :category_id)
        end
    end
end
