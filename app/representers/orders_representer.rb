class OrdersRepresenter
  def initialize(orders)
    @orders = orders
  end

  def as_json
    orders.map do |order|
      {
        id: order.id,
        patient_id: order.pacient_id,
        order_status_type_id: order.order_status_type_id,
        order_status: order.order_status_type.name,
        total_order: order.total_order,
        total_paid: order.total_paid,
        created_at: order.created_at,
        updated_at: order.updated_at,
        patient: pacient_fields(order)
      }
    end  
  end

  private

  attr_reader :orders

  def pacient_fields(order)

    patient = Pacient.select(:name, :lastname, :identifier, :status, :mobile).find_by(id: order.pacient_id)

    {  
      name_complete:  "#{patient&.name} #{patient&.lastname}",
      identifier: patient&.identifier,
      mobile: patient&.mobile,
      status: patient&.status
    }
   
  end

end  
