import 'package:fine/Accessories/index.dart';
import 'package:fine/Constant/view_status.dart';
import 'package:fine/Model/DTO/index.dart';
import 'package:fine/Utils/format_price.dart';
import 'package:fine/ViewModel/orderHistory_viewModel.dart';
import 'package:fine/ViewModel/order_viewModel.dart';
import 'package:fine/ViewModel/root_viewModel.dart';
import 'package:fine/theme/FineTheme/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:scoped_model/scoped_model.dart';

class QRCodeScreen extends StatefulWidget {
  final OrderDTO order;

  const QRCodeScreen({super.key, required this.order});

  @override
  State<QRCodeScreen> createState() => _QRCodeScreenState();
}

class _QRCodeScreenState extends State<QRCodeScreen> {
  RootViewModel root = Get.find<RootViewModel>();
  OrderViewModel _orderViewModel = Get.find<OrderViewModel>();
  @override
  void initState() {
    super.initState();
    Get.find<RootViewModel>()
        .getBoxQrCode(_orderViewModel.orderStatusDTO!.boxId!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FineTheme.palettes.primary100,
      appBar: DefaultAppBar(title: "Box QR Code"),
      body: ScopedModel(
          model: Get.find<OrderHistoryViewModel>(),
          child: ScopedModelDescendant<OrderHistoryViewModel>(
            builder: (context, child, model) {
              return Padding(
                padding: const EdgeInsets.only(right: 16, left: 16),
                child: ListView(
                  children: [
                    const SizedBox(height: 16),
                    _buildOrderInfo(),
                    const SizedBox(height: 16),
                    _buildQrCodeSection(),
                  ],
                ),
              );
            },
          )),
    );
  }

  Widget _buildOrderInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      width: Get.width,
      height: 160,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Mã đơn:',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      fontStyle: FontStyle.normal,
                      color: FineTheme.palettes.shades200),
                ),
              ),
              SizedBox(
                width: 180,
                child: Text(
                  widget.order.orderCode!,
                  style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Giờ lấy hàng tại box:',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      fontStyle: FontStyle.normal,
                      color: FineTheme.palettes.shades200),
                ),
              ),
              SizedBox(
                width: 180,
                child: Text(
                  widget.order.timeSlot!.arriveTime!,
                  style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Vị trí box:',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      fontStyle: FontStyle.normal,
                      color: FineTheme.palettes.shades200),
                ),
              ),
              SizedBox(
                width: 250,
                child: Text(
                  widget.order.stationDTO!.name!,
                  style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal),
                  // overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Tổng đơn hàng:',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      fontStyle: FontStyle.normal,
                      color: FineTheme.palettes.shades200),
                ),
              ),
              SizedBox(
                width: 180,
                child: Text(
                  formatPrice(widget.order.finalAmount!),
                  style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQrCodeSection() {
    return ScopedModel(
        model: Get.find<RootViewModel>(),
        child: ScopedModelDescendant<RootViewModel>(
          builder: (context, child, model) {
            if (model.status == ViewStatus.Loading) {
              return Container(
                padding: const EdgeInsets.fromLTRB(24, 40, 24, 40),
                width: Get.width,
                height: 550,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      // padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'QR Code Của Bạn',
                            style: FineTheme.typograhpy.h2,
                          ),
                          const SizedBox(height: 2),
                          const Text(
                            'Hãy quét mã QR code có tại station',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal),
                          ),
                          const SizedBox(height: 2),
                          const Text(
                            'FINE sẽ giúp bạn mở chiếc tủ bạn cần nha',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    const LoadingFine(),
                  ],
                ),
              );
            }
            return Container(
              padding: const EdgeInsets.fromLTRB(24, 40, 24, 40),
              width: Get.width,
              height: 550,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    // padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'QR Code Của Bạn',
                          style: FineTheme.typograhpy.h2,
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          'Hãy quét mã QR code có tại station',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal),
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          'FINE sẽ giúp bạn mở chiếc tủ bạn cần nha',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  Container(
                    height: 300,
                    width: 300,
                    child: Image.memory(
                      model.imageBytes!,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}