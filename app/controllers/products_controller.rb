class ProductsController < ApplicationController

  def index
    if params[:sort_attribute]
      @products = Product.order(:price)
    elsif params[:search]
      @products = Product.all.where("name ILIKE ?", "%#{params[:search]}%")  
    # elsif params[:discount]
    #   @products = Product.where("price < ?", 15)
    else 
      @products = Product.all
    end

  end


  def products
    @products = Product.all
    
  end

  def show
    # if params[:id] == "random"
    #   @product = Product.all.sample
    # else
    @product = Product.find(params[:id])
  end

  def new

  end

  def edit
    id = params[:id]
  end

  def update
    product = Product.find_by(id: params[:id])
    product.name = params[:name]
    product.price = params[:price]
    product.description = params[:description]
    product.image = params[:image]
    product.assign_attributes({name: params[:name], price: params[:price], description: params[:description], image: params[:image]})
    product.save
    flash[:success] = "Product Updated!"
    redirect_to "/products"
  end

  def create
    name = params[:name]
    price = params[:price]
    description = params[:description]
    image = params[:image]
    product = Product.new(name: name, price: price, description: description, image: image)
    if product.save
    flash[:success] = "Product Created!"
    redirect_to "/products"
    end
  end
    # name = params[:name]
    # price = params[:price]
    # description = params[:description]
    # image_url = params[:image]

    # product = Product.new(name: name, price: price, description: description, image: image_url)

    # product.save
  

  def destroy
    product = Product.find_by(id: params[:id])
    product.delete
    flash[:danger] = "Product Deleted!"
    redirect_to "/products"
  end

end


















