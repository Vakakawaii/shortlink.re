function setParticles() {
    return {
        // 粒子的配置
        particles: {
            // 粒子的数量
            number: {
                value: 50, // 粒子的数量
                density: {
                    enable: true, // 是否启用粒子密度
                    value_area: 800 // 每个粒子占据的空间
                }
            },
            // 粒子的颜色
            color: {
                value: "#fdfdfc" // 粒子的颜色
            },
            // 粒子的形状
            shape: {
                type: "circle", // 粒子的形状
                stroke: {
                    width: 0, // 描边的宽度
                    color: "#000000" // 描边的颜色
                },
                polygon: {
                    nb_sides: 5 // 多边形的边数
                },
                image: {
                    // src: "img/github.svg", // 图片的路径
                    width: 100, // 图片的宽度
                    height: 100 // 图片的高度
                }
            },
            // 粒子的透明度
            opacity: {
                value: 0.5, // 粒子的透明度
                random: true, // 粒子的透明度是否随机
                anim: {
                    enable: false, // 是否启用透明度动画
                    speed: 1, // 透明度动画的速度
                    opacity_min: 0.1, // 最小透明度
                    sync: false // 透明度动画是否同步
                }
            },
            // 粒子的大小
            size: {
                value: 10, // 粒子的大小
                random: true, // 粒子的大小是否随机
                anim: {
                    enable: false, // 是否启用大小动画
                    speed: 40, // 大小动画的速度
                    size_min: 0.1, // 最小大小
                    sync: false // 大小动画是否同步
                }
            },
            // 粒子之间的连线
            line_linked: {
                enable: false, // 是否启用连线
                distance: 500, // 连线的距离
                color: "#ffffff", // 连线的颜色
                opacity: 0.4, // 连线的透明度
                width: 2 // 连线的宽度
            },
            // 粒子的移动
            move: {
                enable: true, // 是否启用移动
                speed: 2.5, // 移动的速度
                direction: "bottom", // 移动的方向
                random: false, // 移动是否随机
                straight: false, // 移动是否直线
                out_mode: "out", // 移动的模式
                bounce: false, // 是否反弹
                attract: {
                    enable: false, // 是否吸引
                    rotateX: 600, // X轴旋转
                    rotateY: 1200 // Y轴旋转
                }
            }
        },
        // 交互的配置
        interactivity: {
            detect_on: "canvas", // 交互的检测方式
            events: {
                onhover: {
                    enable: true, // 是否启用悬停
                    mode: "bubble" // 悬停的模式
                },
                onclick: {
                    enable: true, // 是否启用点击
                    mode: "repulse" // 点击的模式
                },
                resize: true // 是否启用调整大小
            },
            modes: {
                grab: {
                    distance: 400, // 抓取的距离
                    line_linked: {
                        opacity: 0.5 // 连线的透明度
                    }
                },
                bubble: {
                    distance: 400, // 泡沫的距离
                    size: 4, // 泡沫的大小
                    duration: 0.3, // 泡沫的持续时间
                    opacity: 1, // 泡沫的透明度
                    speed: 3 // 泡沫的速度
                },
                repulse: {
                    distance: 200, // 排斥的距离
                    duration: 0.4 // 排斥的持续时间
                },
                push: {
                    particles_nb: 4 // 推动的粒子数量
                },
                remove: {
                    particles_nb: 2 // 移除的粒子数量
                }
            }
        },
        retina_detect: true // 是否检测视网膜
    }


}

export default setParticles()