module RecordSelect
  module Actions
    # :method => :get
    # params => [:page, :search]
    def browse
      klass = record_select_config.model
      # by default: record_select_config.wurl_disable_thinking_sphinx_search = false
      if (!record_select_config.wurl_disable_thinking_sphinx_search) and (klass.respond_to?(:search))
        @searchparams = params[:search]
        @results = []
        res = get_search_by_id_result
        if (res)
          @results << res
          @result_total_entries = 1
        else
          @results = klass.search @searchparams, :page=>params[:page], :per_page=>record_select_config.per_page

          # Number of matches in Sphinx
          @result_total_entries = @results.total_entries
        end
        pager = ::Paginator.new(@result_total_entries, record_select_config.per_page) do |offset, per_page|
          getpage(offset, per_page)
        end

        @page = pager.page(params[:page] || 1)
      else
        conditions = record_select_conditions

        #klass = record_select_config.model
        count = klass.count(:conditions => conditions, :include => record_select_includes)
        pager = ::Paginator.new(count, record_select_config.per_page) do |offset, per_page|
          klass.find(:all, :offset => offset,
                           :include => [record_select_includes, record_select_config.include].flatten.compact,
                           :limit => per_page,
                           :conditions => conditions,
                           :order => record_select_config.order_by)
        end
        @page = pager.page(params[:page] || 1)
      end

      respond_to do |wants|
          wants.html {
            render_record_select '_browse.html', :layout => true
          }
          wants.js {
            if params[:update]
              render_record_select 'browse.rjs'
            else
              render_record_select '_browse.rhtml'
            end
          }
          wants.yaml {}
          wants.xml {}
          wants.json {}
        end
    end

    # :method => :post
    # params => [:id]
    def select
      klass = record_select_config.model
      record = klass.find(params[:id])
      if record_select_config.notify.is_a? Proc
        record_select_config.notify.call(record)
      elsif record_select_config.notify
        send(record_select_config.notify, record)
      end
      render :nothing => true
    end

    protected

    def record_select_config #:nodoc:

      self.class.record_select_config
    end

    def render_record_select(file, options = {}) #:nodoc:
      options[:layout] ||= false
      options[:file] = record_select_path_of(file)
      options[:use_full_path] = false
      render options
    end

    private

    def record_select_views_path
      @record_select_views_path ||= "vendor/plugins/#{File.expand_path(__FILE__).match(/vendor\/plugins\/(\w*)/)[1]}/lib/views"
    end

    def record_select_path_of(template)
      File.join(RAILS_ROOT, record_select_views_path, template)
    end

    def is_do_search_by_id?
     if (record_select_config.wurl_allow_search_by_id) and @searchparams and !@searchparams.strip.empty? \
        and is_a_number?(@searchparams) and (@searchparams.to_i > 0)
       return true
     else
       return false
     end
    end

    # return find_by_id result, if not found, return nil
    def get_search_by_id_result
      if is_do_search_by_id?
          klass = record_select_config.model
          res = klass.find_by_id(@searchparams)
          return res
      end
      return nil
    end

    def getpage(offset, per_page)
      pagenum = params[:page]
      my_page_res_arr = []
      for i in 0..(per_page-1) # thinking sphinx search results only has the current page data, so no need to use offset
       my_page_res_arr << @results[i]   if @results[i]  #results[i] might be nil, if num of results < per_page
      end
      my_page_res_arr
    end

    def is_a_number?(s)
      ss = s.strip
      ss.to_i.to_s == ss
    end
  end
end

