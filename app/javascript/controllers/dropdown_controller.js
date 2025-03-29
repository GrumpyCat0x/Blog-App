import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        this.initializeDropdown();
    }

    initializeDropdown() {
        // 获取下拉菜单切换元素
        const dropdownToggle = this.element.querySelector('.dropdown-toggle');

        // 如果存在，初始化Bootstrap下拉菜单
        if (dropdownToggle) {
            // 创建新的Dropdown实例
            this.dropdown = new bootstrap.Dropdown(dropdownToggle);

            // 添加点击事件监听器
            dropdownToggle.addEventListener('click', (event) => {
                event.stopPropagation();
                this.dropdown.toggle();
            });
        }
    }

    disconnect() {
        // 清理下拉菜单实例
        if (this.dropdown) {
            this.dropdown.dispose();
        }
    }
}