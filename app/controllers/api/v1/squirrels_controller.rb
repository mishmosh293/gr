class Api::V1::SquirrelsController < Api::V1::GraphitiController
  def index
    squirrels = SquirrelResource.all(params)
    respond_with(squirrels)
  end

  def show
    squirrel = SquirrelResource.find(params)
    respond_with(squirrel)
  end

  def create
    squirrel = SquirrelResource.build(params)

    if squirrel.save
      render jsonapi: squirrel, status: 201
    else
      render jsonapi_errors: squirrel
    end
  end

  def update
    squirrel = SquirrelResource.find(params)

    if squirrel.update_attributes
      render jsonapi: squirrel
    else
      render jsonapi_errors: squirrel
    end
  end

  def destroy
    squirrel = SquirrelResource.find(params)

    if squirrel.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: squirrel
    end
  end
end
