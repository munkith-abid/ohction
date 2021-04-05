module ItemsHelper
  include ActionView::Helpers::TagHelper
  module InstanceHelper
    def started?
      Item.dezone(Time.now) >= Item.dezone(start_time)
    end

    def ended?
      Item.dezone(Time.now) > Item.dezone(end_time)
    end
    
    def sold?
      ended? && (current_price + starting_price) > minimum_price
      # !!self.buyer_id
    end
    
    def active?
      started? && !ended?
    end

    def set_sold
      # binding.pry
      self.images.clear
      self.images << Image.find_or_create_by(path: 'sold.jpg')
      self.buyer_id = Bid.last.user_id
      self.save
    end

    def owner? current_user
      # binding.pry
      seller_id == current_user.id
    end

    # def status_based_display item
    #   if item.sold?
    #     tag.li 'this item is sold', class:"list-group-item"
    #   elsif item.owner? current_user
    #     true
    #   end

    # enddef 
    
  end

  

  module ClassHelper
    def dezone(time)
      time.strftime('%Y-%m-%d %H:%M:%S')
    end

    def diplay_all_items
      Item.all.map do |item|
        tag.div id: 'carouselExampleSlidesOnly', class: 'carousel slide' do
          tag.div class: 'carousel-inner' do
            tag.div class: 'carousel-item active p-1 border bg-dark' do
              item.images.each do |image|
                image_tag image.path, class: 'd-block w-30 img-fluid'
              end
            end
            # tag.div class: "carousel-item  p-1 border bg-dark " do
            #    image_tag "signin-image.jpg", class:"d-block w-30 img-fluid"
            # end
            # tag.div class: "carousel-item  p-1 border bg-dark" do
            #    image_tag "signup-image-2.jpg", class:"d-block w-30 img-fluid"
            # end
          end
        end
        # tag.div class: "card-body " do
        #   tag.h5 'Card title', class: "card-title"
        #   # p class: "card-text" Some quick example text to build on the card title and make up the bulk of the card's content./p
        # end
        # ul class: "list-group list-group-flush"
        #   li class: "list-group-item" An item/li
        #   li class: "list-group-item" A second item/li
        #   li class: "list-group-item" A third item/li
        # /ul
        # tag.div class: "card-body" do
        #   a href: "#" class: "card-link" Card link/a
        #   a href: "#" class: "card-link" Another link/a
        # end
      end
    end
  end
end
