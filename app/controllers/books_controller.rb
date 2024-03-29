class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  # GET /books.json
  
    # @books = Book.all
  def index
    # @search = Book.search do
    # @search = Sunspot.search(Tag,Book) do

    # @search_choice = params[:search]
    # if @search_choice == 'book'
      @search = Sunspot.search(Book) do |query| 
      query.keywords params[:search]
      # query.fulltext params[:search]
      # query.with(:age).less_than 2
      query.order_by(:created_at, :desc)
      query.with(:created_at).less_than(Time.zone.now)
      query.facet(:publish_month)
      query.with(:publish_month, params[:month]) if params[:month].present?
      end
      @books = @search.results
    # else

      @search_all = Sunspot.search(Tag,Book) do
      fulltext params[:search_all]
      with(:created_at).less_than(Time.zone.now)
      facet(:publish_month)
      with(:publish_month, params[:month]) if params[:month].present?
      end
      @books_tag_all = @search_all.results
    # end  
  end
  
  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :author)
    end
end
