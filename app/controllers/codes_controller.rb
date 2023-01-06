class CodesController < ApplicationController
  before_action :set_code, only: [:show, :update, :destroy]

#Solo regreasa los valores no vendidos
  def no_mitidos
    @nCodes = Code.all
    nMitidos = []
    @nCodes.each { |d| if d.voucher_vendido == false then nMitidos.push(d)  end}
      @Mitidofalse = nMitidos
      render json: @Mitidofalse
  end

  def ventashoy
    dia_Act=Time.now.strftime("%F").to_s
    @fechahoy=Code.all
    @variable = [] 
    @fechahoy.each {|res|
    if res.pvalor != nil && res.pvalor != 5
      if res.voucher_vendido == true
        if res.created_at.strftime("%F").to_s == dia_Act then
          @variable.push(res.pvalor)
        end
      end
    end
      }
    render json: @variable.sum()
    end

    def ventasayer
        @valoreayer = []
        mes_ahora=Time.now.month
        dia_atras=Time.now.day.to_i - 1
        fechayer=Code.all
        fechayer.each {|res|
          if res.pvalor != nil && res.pvalor != 5
           #if res.voucher == true
           if res.created_at.strftime("%F").to_date.month == mes_ahora
              if res.created_at.strftime("%F").to_date.day == dia_atras
              @valoreayer.push(res.pvalor)
              end
           end
          end
           #end
        }
        render json: @valoreayer.sum()
    end

    def ventas_este_mes
      @estemes=[]
      mes_ahora=Time.now.month
      allfecha=Code.all
      allfecha.each { |res|
      #if res.voucher_vendido == true
        if res.created_at.strftime("%F").to_date.month == mes_ahora
          @estemes.push(res.pvalor)
      end
      #end
      }
      render json: @estemes.sum()
    end
    def ventas_mespasado
      mespasado=[]
      mes_pasado=Time.now.month - 1
      total_ventas=Code.all
      total_ventas.each{|res| 
      if res.pvalor != nil && res.pvalor != 5
        if res.created_at.strftime("%F").to_date.month == 12 && mes_pasado == 0
          mespasado.push(res.pvalor)
      else
          if (res.created_at.strftime("%F").to_date.month - 1) == mes_pasado
            mespasado.push(res.pvalor)
          end
        end
      end
      }
      render json: {valortotal:mespasado.sum()} 
    end


  def last_code
    @CodeLast = Code.last
    render json: @CodeLast
  end

  def imprime_ultimoscinco
    @nCodes = Code.all().order(id: :desc).limit(10 )
    nMitidos = []
    @nCodes.each { |d| if d.voucher_vendido == false && d.cod_market != d.cod_panaderia then nMitidos.push(d)  end}
      @Mitidofalse = nMitidos
      render json: @Mitidofalse
  end

  def vouchers_panaderia
    pvoucher = Code.all
    meshoy=Time.now.month
    diahoy=Time.now.day + 1
    vpanaderia=[]
    puts diahoy
    pvoucher.each{|d| 
      if d.created_at.strftime("%F").to_date.month == meshoy && d.created_at.strftime("%F").to_date.day==diahoy
          if(d.panaderia==true && d.market==false)
          return  vpanaderia.push(d)
          end
      end
    }
    @emitidopanaderia=vpanaderia
    render json: @emitidopanaderia
  end

  def voucher_market
    pvoucher = Code.all().order(id: :desc).limit(10)
    meshoy=Time.now().month
    diahoy=Time.now().day
    vmarket=[]
    pvoucher.each{|d| 
      if d.created_at.strftime("%F").to_date.month == meshoy && d.created_at.strftime("%F").to_date.day==diahoy
          if(d.market==true && d.panaderia==false)
            vmarket.push(d)
          end
      end
    }
    render json: vmarket
  end

  # GET /codes
  def index
    @codes = Code.all

    render json: @codes, :include =>[:product => {:include => [:category]}]
  end

  # GET /codes/1
  def show
    render json: @code
  end

  # POST /codes
  def create
    @code = Code.new(code_params)

    if @code.save
      render json: @code, status: :created, location: @code
    else
      render json: @code.errors, status: :unprocessable_entity
    end
  end
  

  # PATCH/PUT /codes/1
  def update
    if @code.update(code_params)
      render json: @code
    else
      render json: @code.errors, status: :unprocessable_entity
    end
  end

  # DELETE /codes/1
  def destroy
    @code.destroy
  end

  def last_code
    @codes = Code.all

    render json: @codes.last
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_code
      @code = Code.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def code_params
      params.require(:code).permit(:hora_emision, :cod_market, :market,:pcodigo, :panaderia, :cod_panaderia, :pvalor, :voucher_vendido, :total_doble)
    end
end
