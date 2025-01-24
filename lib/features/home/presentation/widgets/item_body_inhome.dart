import 'package:flutter/material.dart';
import 'package:vitamins/constants/images.dart';
import 'package:vitamins/core/styles/text_styles.dart';
import 'package:vitamins/features/home/domain/entities/product_entity.dart';

class ItemBodyInHome extends StatelessWidget {
  final ProductEntity product;

  const ItemBodyInHome({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, // لتجنب تقطيع المحتوى عند وضع العنصر في مكان معين
      children: [
        // الـ Material الذي يحتوي على المنتج
        Material(
          elevation: 4.0, // يمكنك تغيير القيمة هنا حسب الظل الذي تريده
          shadowColor: Colors.black.withOpacity(0.2), // التحكم في لون الظل
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // عرض الصورة للمنتج
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffEEEEF0),
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(10.0),
                    ),
                  ),
                  child: Center(
                    child: Image.network(
                      product.image,
                      fit: BoxFit.contain,
                      height: 100.0,
                      width: 100.0,
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    product.name,
                    style: TextStyles.textstyleinitem,
                  ),
                ),
                const SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    '\$${product.price}',
                    style: TextStyles.textstyleinitem.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // الصورة التي ستكون في الأعلى الآن
        Positioned(
          bottom: 20, // تعديل المسافة لتكون في الأعلى
          
          right: 0,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // الصورة التي في الأعلى
              Image.asset(
                Assets.imagesRectangleshape, // مسار الصورة
                height: 20.0, // تعديل الحجم حسب الحاجة
                fit: BoxFit.contain,
              ),
              Positioned(
                top: 2, // تعديل المسافة لتحديد مكان الرقم
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '2', // الرقم
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 4.0),
                    const Icon(
                      Icons.star, // النجمة
                      color: Colors.yellow,
                      size: 15.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
