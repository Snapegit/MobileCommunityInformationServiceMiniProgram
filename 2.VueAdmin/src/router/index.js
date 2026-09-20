	import {
		createRouter,
		createWebHashHistory
	} from 'vue-router'
	import sheshibaoxiu from '@/views/sheshibaoxiu/list'
	import shuidianfeixinxi from '@/views/shuidianfeixinxi/list'
	import baoxiuchuli from '@/views/baoxiuchuli/list'
	import storeup from '@/views/storeup/list'
	import users from '@/views/users/list'
	import shequxiaoxi from '@/views/shequxiaoxi/list'
	import forum from '@/views/forum/list'
	import yonghu from '@/views/yonghu/list'
	import huodongbaoming from '@/views/huodongbaoming/list'
	import wuyefeixinxi from '@/views/wuyefeixinxi/list'
	import discussshequhuodong from '@/views/discussshequhuodong/list'
	import shequhuodong from '@/views/shequhuodong/list'
	import config from '@/views/config/list'

export const routes = [{
		path: '/login',
		name: 'login',
		component: () => import('../views/login.vue')
	},{
		path: '/',
		name: '首页',
		component: () => import('../views/index'),
		children: [{
			path: '/',
			name: '首页Home',
			component: () => import('../views/HomeView.vue'),
			meta: {
				affix: true
			}
		}, {
			path: '/updatepassword',
			name: '修改密码',
			component: () => import('../views/updatepassword.vue')
		}
		
		,{
			path: '/sheshibaoxiu',
			name: '设施报修',
			component: sheshibaoxiu
		}
		,{
			path: '/shuidianfeixinxi',
			name: '水电费信息',
			component: shuidianfeixinxi
		}
		,{
			path: '/baoxiuchuli',
			name: '报修处理',
			component: baoxiuchuli
		}
		,{
			path: '/storeup',
			name: '我的收藏',
			component: storeup
		}
		,{
			path: '/users',
			name: '管理员',
			component: users
		}
		,{
			path: '/shequxiaoxi',
			name: '社区消息',
			component: shequxiaoxi
		}
		,{
			path: '/forum',
			name: '我的发布',
			component: forum
		}
		,{
			path: '/yonghu',
			name: '用户',
			component: yonghu
		}
		,{
			path: '/huodongbaoming',
			name: '活动报名',
			component: huodongbaoming
		}
		,{
			path: '/wuyefeixinxi',
			name: '物业费信息',
			component: wuyefeixinxi
		}
		,{
			path: '/discussshequhuodong',
			name: '社区活动评论',
			component: discussshequhuodong
		}
		,{
			path: '/shequhuodong',
			name: '社区活动',
			component: shequhuodong
		}
		,{
			path: '/config',
			name: '轮播图',
			component: config
		}
		]
	},
]

const router = createRouter({
	history: createWebHashHistory(process.env.BASE_URL),
	routes
})

export default router
