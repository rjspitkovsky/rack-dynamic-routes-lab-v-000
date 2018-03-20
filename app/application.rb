class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items").last
      item = @@items.find{|i| i.name = item_name}

      if @@items.include?(item)
        resp.write item.price
      else
        resp.status = 400
        resp.write "We don't have that item"
      end

    else
      resp.status = 404
    end

  end
end 
