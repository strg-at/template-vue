import '../assets/main.css'
import HelloWorld from './HelloWorld.vue'
import type { Meta, StoryObj } from '@storybook/vue3'

const meta: Meta<typeof HelloWorld> = {
  title: 'Components/HelloWorld',
  component: HelloWorld,
  argTypes: {
    msg: { control: 'text' },
  },
}

export default meta

type Story = StoryObj<typeof HelloWorld>

export const Default: Story = {
  args: {
    msg: 'Hello Storybook',
  },
}
