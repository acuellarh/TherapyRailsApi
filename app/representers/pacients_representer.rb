class PacientsRepresenter
      def initialize(pacients)
        @pacients = pacients
      end

      def as_json
        pacients.map do |pacient|
          {
            id: pacient.id,
            name: pacient.name,
            lastname: pacient.lastname,
            name_complete: pacient_name(pacient),
            birthday: pacient.birthday,
            identifier: pacient.identifier,
            document_type: pacient.document_type.name,
            mobile: pacient.mobile,
            email: pacient.email,
            address: pacient.address,
            other_contact: pacient.other_contact,
            other_contact_mobile: pacient.other_contact_mobile,
            other_contact_pacient_relation: pacient.relationship.name,
            status: pacient.status,
            gender: pacient.gender.name
          }
        end  
      end

      private

      attr_reader :pacients

      def pacient_name(pacient)
        "#{pacient.name} #{pacient.lastname}"        
      end
end  