export interface Database {
  public: {
    Tables: {
      Mappins: {
        Row: {
          id: number;
          building_name: string;
          break_time: string;
          last_order_time: string;
          instagram: string;
          call_number: string;
          street_address: string;
          address: string;
          info_link: string;
          latitude: string;
          longitude: string;
          category: string;
          hashtag: string;
          reservation_availability: string;
          deilvery_availability: boolean;
          packaging_availability: boolean;
          parking_lot_availability: boolean;
          bathroom_availability: boolean;
          wifi_availability: boolean;
          other_facilities: string;
          desciption: string;
          writer: string;
          write_time: Date;
          edit_time: Date;
          other_info: string;
        };

        Insert: {
          // 추후 추가 예정
        };

        Update: {
          // 추후 추가 예정
        };
      }
    }
  }
}