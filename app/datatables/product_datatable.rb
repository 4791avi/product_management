class ProductDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable
  def_delegators :@view, :edit_product_path

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      # id: { source: "User.id", cond: :eq },
      # name: { source: "User.name", cond: :like }
      id:             { source: "Product.id" },
      name:           { source: "Product.name" },
      description:    { source: "Product.description" },
      price:          { source: "Product.price", searchable: false },
      availability:   { source: "Product.availability" },
      img_url:        { source: "Product.img_url" }
    }
  end

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def data
    records.map do |record|
      {
          name:           record.name,
          description:    record.description,
          price:          record.price,
          availability:   record.availability,
          img_url:        record.img_url,
          action:         action(record),
          id:             record.id
      }
    end
  end
  def get_raw_records
    Product.all
  end

private
  def action(product)
    html = <<-HTML
      <div>
        <a href= "#{edit_product_path(product.id)}" >Edit</a> /
        <a data-confirm="Are you sure?" rel="nofollow" data-method="delete" href="/products/#{product.id}">Delete</a>
      </div>
      HTML
      html.html_safe
  end 
end