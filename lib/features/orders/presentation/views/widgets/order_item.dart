import 'package:e_commerce_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:e_commerce_dashboard/features/orders/domain/entities/order_product_entity.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  final OrderEntity order;
  final VoidCallback? onTap;

  const OrderItem({
    super.key,
    required this.order,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _OrderHeader(order: order),
            const Divider(height: 1, indent: 16, endIndent: 16),
            _ProductList(products: order.orderProducts),
            const Divider(height: 1, indent: 16, endIndent: 16),
            _OrderFooter(order: order),
          ],
        ),
      ),
    );
  }
}

class _OrderHeader extends StatelessWidget {
  final OrderEntity order;
  const _OrderHeader({required this.order});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 12),
      child: Row(
        children: [
          // Order icon
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A2E).withValues(alpha: 0.06),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.receipt_long_rounded,
              size: 20,
              color: Color(0xFF1A1A2E),
            ),
          ),
          const SizedBox(width: 12),

          // Order ID + customer name
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order #${order.orderId}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: Color(0xFF1A1A2E),
                    letterSpacing: 0.2,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  order.shippingAddressEntity.name ?? '—',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // Status badge
          _StatusBadge(status: 'pending'),
        ],
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String status;
  const _StatusBadge({required this.status});

  Color get _bg {
    switch (status.toLowerCase()) {
      case 'delivered':
        return const Color(0xFFE6F9F1);
      case 'shipped':
        return const Color(0xFFE8F4FD);
      case 'cancelled':
        return const Color(0xFFFFEEEE);
      default:
        return const Color(0xFFFFF4E5); // pending
    }
  }

  Color get _fg {
    switch (status.toLowerCase()) {
      case 'delivered':
        return const Color(0xFF1DB974);
      case 'shipped':
        return const Color(0xFF1A8FE3);
      case 'cancelled':
        return const Color(0xFFE03E3E);
      default:
        return const Color(0xFFFF8C00); // pending
    }
  }

  IconData get _icon {
    switch (status.toLowerCase()) {
      case 'delivered':
        return Icons.check_circle_rounded;
      case 'shipped':
        return Icons.local_shipping_rounded;
      case 'cancelled':
        return Icons.cancel_rounded;
      default:
        return Icons.access_time_rounded; // pending
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: _bg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(_icon, size: 12, color: _fg),
          const SizedBox(width: 4),
          Text(
            status[0].toUpperCase() + status.substring(1),
            style: TextStyle(
              color: _fg,
              fontWeight: FontWeight.w600,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductList extends StatelessWidget {
  final List<OrderProductEntity> products;
  const _ProductList({required this.products});

  @override
  Widget build(BuildContext context) {
    // Show max 2 items, with overflow indicator
    final visible = products.take(2).toList();
    final overflow = products.length - visible.length;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          ...visible.map((p) => _ProductRow(product: p)),
          if (overflow > 0)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
              child: Text(
                '+$overflow more item${overflow > 1 ? 's' : ''}',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade500,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _ProductRow extends StatelessWidget {
  final OrderProductEntity product;
  const _ProductRow({required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              product.imageUrl,
              width: 46,
              height: 46,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 46,
                height: 46,
                color: Colors.grey.shade100,
                child: Icon(Icons.image_not_supported_rounded,
                    size: 20, color: Colors.grey.shade400),
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Name + code
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: Color(0xFF1A1A2E),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  'SKU: ${product.code}',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          ),

          // Qty + price
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$${product.price.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                  color: Color(0xFF1A1A2E),
                ),
              ),
              const SizedBox(height: 2),
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  'x${product.quantity}',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _OrderFooter extends StatelessWidget {
  final OrderEntity order;
  const _OrderFooter({required this.order});

  @override
  Widget build(BuildContext context) {
    final addr = order.shippingAddressEntity;
    final addressLine = [addr.address, addr.city]
        .where((e) => e != null && e.isNotEmpty)
        .join(', ');

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Left: payment + address
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _FooterChip(
                  icon: _paymentIcon(order.paymentMethod),
                  label: order.paymentMethod,
                ),
                if (addressLine.isNotEmpty) ...[
                  const SizedBox(height: 6),
                  _FooterChip(
                    icon: Icons.location_on_rounded,
                    label: addressLine,
                  ),
                ],
              ],
            ),
          ),

          // Right: total
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Total',
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                '\$${order.totalPrice.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1A1A2E),
                  letterSpacing: -0.5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  IconData _paymentIcon(String method) {
    switch (method.toLowerCase()) {
      case 'card':
      case 'credit card':
        return Icons.credit_card_rounded;
      case 'cash':
      case 'cod':
        return Icons.payments_rounded;
      case 'paypal':
        return Icons.account_balance_wallet_rounded;
      default:
        return Icons.payment_rounded;
    }
  }
}

class _FooterChip extends StatelessWidget {
  final IconData icon;
  final String label;
  const _FooterChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 13, color: Colors.grey.shade500),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}