namespace Sacu.Utils
{
    public class SALockFreeQueue <T>
    {
        public int head;
        public int tail;
        public T[] items;

        public int Count
        {
            get
            {
                return tail - head;
            }
        }

        private int capacity;

        public SALockFreeQueue()
            : this(64)
        {
        }

        public SALockFreeQueue(int count)
        {
            items = new T[count];
            tail = head = 0;
            capacity = count;
        }

        public bool IsEmpty()
        {
            return head == tail;
        }

        public void Clear()
        {
            head = tail = 0;
        }

        bool IsFull()
        {
            return tail - head >= capacity;
        }
    
        public void Enqueue(T item)
        {
            while (IsFull())
            {
                System.Threading.Thread.Sleep(1);
            }

            int pos = tail % capacity;
            items[pos] = item;
            ++tail;
        }
    
        public T Dequeue()
        {
            if (IsEmpty())
            {
                return default(T);
            }

            int pos = head % capacity;
            T item = items[pos];
            ++head;
            return item;
        }
    }
}

